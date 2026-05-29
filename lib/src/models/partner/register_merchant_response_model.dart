import 'response_status_model.dart';

class ABARegisterMerchantResponseModel {
  /// This is the onboarding form url. Partner shall redirect user to this URL
  /// so that they can do the registration.
  final String? url;

  /// The unique token represent the session of the request.
  final String? token;

  final ABAPartnerResponseStatusModel status;

  ABARegisterMerchantResponseModel({this.url, this.token, required this.status});

  factory ABARegisterMerchantResponseModel.fromJson(dynamic json) {
    return ABARegisterMerchantResponseModel(url: json['url'], token: json['token'], status: ABAPartnerResponseStatusModel.fromJson(json['status']));
  }

  Map<String, dynamic> toJson() {
    return {'url': url, 'token': token, 'status': status};
  }
}
