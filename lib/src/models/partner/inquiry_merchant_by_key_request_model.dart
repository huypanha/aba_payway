class ABAInquiryMerchantByKeyRequestModel {
  /// Your merchant key provided by ABA Bank.
  final String merchantKey;

  /// Public key provided by ABA Bank.
  final String apiKey;

  /// Public rsa public key provided by ABA Bank.
  final String? rsaPublicKey;

  ABAInquiryMerchantByKeyRequestModel({required this.merchantKey, required this.apiKey, this.rsaPublicKey});

  Map<String, dynamic> toJson() {
    return {'merchantKey': merchantKey, 'apiKey': apiKey, 'rsaPublicKey': rsaPublicKey};
  }
}
