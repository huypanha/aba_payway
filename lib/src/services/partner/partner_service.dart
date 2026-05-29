import 'package:aba_payway/src/models/partner/inquiry_merchant_by_key_request_model.dart';
import 'package:aba_payway/src/models/partner/inquiry_merchant_response_model.dart';

import '../../models/partner/register_merchant_request_model.dart';
import '../../models/partner/register_merchant_response_model.dart';

abstract class ABAPartnerService {
  Future<ABARegisterMerchantResponseModel> registerMerchant(ABARegisterMerchantRequestModel request) async {
    throw UnimplementedError();
  }

  Future<ABAInquiryMerchantResponseModel> inquiryMerchantByRef(String registerRef) async {
    throw UnimplementedError();
  }

  Future<ABAInquiryMerchantResponseModel> inquiryMerchantByKey(ABAInquiryMerchantByKeyRequestModel request) async {
    throw UnimplementedError();
  }
}
