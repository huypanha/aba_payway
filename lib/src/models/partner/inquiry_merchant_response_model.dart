import 'package:aba_payway/src/models/partner/inquiry_merchant_response_data_model.dart';

import 'response_status_model.dart';

class ABAInquiryMerchantResponseModel {
  final ABAInquiryMerchantResponseDataModel? data;
  final ABAPartnerResponseStatusModel status;

  ABAInquiryMerchantResponseModel({this.data, required this.status});

  factory ABAInquiryMerchantResponseModel.fromJson(dynamic json) {
    return ABAInquiryMerchantResponseModel(
      data: json['data'] != null ? ABAInquiryMerchantResponseDataModel.fromJson(json['data']) : null,
      status: ABAPartnerResponseStatusModel.fromJson(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'data': data?.toJson(), 'status': status.toJson()};
  }
}
