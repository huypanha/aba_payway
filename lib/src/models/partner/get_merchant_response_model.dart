import 'package:aba_payway/src/models/partner/get_merchant_response_data_model.dart';

import 'response_status_model.dart';

class ABAGetMerchantResponseModel {
  final ABAGetMerchantResponseDataModel? data;
  final ABAPartnerResponseStatusModel status;

  ABAGetMerchantResponseModel({this.data, required this.status});

  factory ABAGetMerchantResponseModel.fromJson(dynamic json) {
    return ABAGetMerchantResponseModel(
      data: json['data'] != null ? ABAGetMerchantResponseDataModel.fromJson(json['data']) : null,
      status: ABAPartnerResponseStatusModel.fromJson(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'data': data?.toJson(), 'status': status.toJson()};
  }
}
