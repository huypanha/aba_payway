import '../../utils/enums.dart';

class ABARegisterMerchantRequestModel {
  /// Once merchant complete the registration. PayWay will pass the details of the merchant to this URL.
  final String pushbackUrl;

  /// After completing the registration process, a button appears on the success
  /// screen of PayWay. This URL will be embedded in that button.
  final String redirectUrl;

  /// Source of activation platform.
  final ABAActivationPlatformSourceEnum type;

  /// Your request reference number. You should send unique value for each request.
  final String registerRef;

  /// Merchant type.
  final ABAMerchantTypeEnum merchantType;

  /// Merchant currency that you want to register.
  final ABACurrencyEnum currency;

  ABARegisterMerchantRequestModel({
    required this.pushbackUrl,
    required this.redirectUrl,
    this.type = .web,
    required this.registerRef,
    this.merchantType = .online,
    required this.currency,
  }) : assert(registerRef.length <= 250, 'Reference ID must not exceed 250 characters');

  Map<String, dynamic> get requestData => {
    'pushback_url': pushbackUrl,
    'redirect_url': redirectUrl,
    'type': type.index,
    'register_ref': registerRef,
    'merchant_type': merchantType.index,
    'currency': currency.name,
  };

  Map<String, dynamic> toJson() {
    return {
      'pushbackUrl': pushbackUrl,
      'redirectUrl': redirectUrl,
      'type': type.name,
      'registerRef': registerRef,
      'merchantType': merchantType.name,
      'currency': currency.name,
    };
  }
}
