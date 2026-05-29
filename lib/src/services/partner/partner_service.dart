import 'package:aba_payway/src/models/partner/get_merchant_response_model.dart';

import '../../models/partner/register_merchant_request_model.dart';
import '../../models/partner/register_merchant_response_model.dart';

abstract class ABAPartnerService {
  Future<ABARegisterMerchantResponseModel> registerMerchant(ABARegisterMerchantRequestModel request) async {
    throw UnimplementedError();
  }

  Future<ABAGetMerchantResponseModel> getMerchantByRegisterRef(String registerRef) async {
    throw UnimplementedError();
  }
}
