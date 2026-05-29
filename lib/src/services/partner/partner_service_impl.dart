import 'dart:convert';

import 'package:aba_payway/src/models/partner/get_merchant_response_model.dart';
import 'package:aba_payway/src/utils/exception.dart';
import 'package:aba_payway/src/utils/openssl.dart';
import 'package:intl/intl.dart';

import '../../models/partner/register_merchant_request_model.dart';
import '../../models/partner/register_merchant_response_model.dart';
import '../../utils/hash.dart';
import '../../utils/throw_error.dart';
import '../api_service.dart';
import 'partner_service.dart';

class ABAPartnerServiceImpl implements ABAPartnerService {
  late ApiService _apiService;
  final String _route = 'api/merchant-portal/online-self-activation';

  ABAPartnerServiceImpl(ApiService apiService) {
    _apiService = apiService;
  }

  @override
  Future<ABARegisterMerchantResponseModel> registerMerchant(ABARegisterMerchantRequestModel request) async {
    if (_apiService.publicKey == '') {
      throw ABAException(statusCode: 400, errorCode: 'PTL04', message: 'The publicKey field is required');
    }
    if (_apiService.partnerId == '') {
      throw ABAException(statusCode: 400, errorCode: 'PTL04', message: 'The partnerId field is required');
    }

    final reqData = opensslEncrypt(request.requestData, _apiService.publicKey);
    final reqTime = DateFormat('YYYYMMDDHHmmss').format(.now().toUtc());
    final body = {
      'request_time': reqTime,
      'partner_id': _apiService.partnerId,
      'request_data': reqData,
      'reference_id': request.registerRef,
      'hash': generateHash(data: "${_apiService.partnerId}$reqData$reqTime", partnerId: _apiService.partnerId),
    };
    final response = await _apiService.post('$_route/new-merchant', data: jsonEncode(body));
    if (response.statusCode == 200) {
      return ABARegisterMerchantResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      throw errorParserResponse(response);
    }
  }

  @override
  Future<ABAGetMerchantResponseModel> getMerchantByRegisterRef(String registerRef) async {
    if (_apiService.publicKey == '') {
      throw ABAException(statusCode: 400, errorCode: 'PTL04', message: 'The publicKey field is required');
    }
    if (_apiService.partnerId == '') {
      throw ABAException(statusCode: 400, errorCode: 'PTL04', message: 'The partnerId field is required');
    }

    final reqData = opensslEncrypt({'register_ref': registerRef}, _apiService.publicKey);
    final reqTime = DateFormat('YYYYMMDDHHmmss').format(.now().toUtc());
    final body = {
      'request_time': reqTime,
      'partner_id': _apiService.partnerId,
      'request_data': reqData,
      'hash': generateHash(data: "${_apiService.partnerId}$reqData$reqTime", partnerId: _apiService.partnerId),
    };
    final response = await _apiService.post('$_route/get-mc-credential-info', data: jsonEncode(body));
    if (response.statusCode == 200) {
      return ABAGetMerchantResponseModel.fromJson(response.data);
    } else {
      throw errorParserResponse(response);
    }
  }
}
