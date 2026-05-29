class ABAInquiryMerchantResponseDataModel {
  final String? outletName;
  final String? abaAccountKhr;
  final String? abaAccountUsd;
  final Map<String, dynamic>? availablePaymentMethods;
  final Map<String, dynamic>? enabledPaymentMethods;
  final Map<String, dynamic>? pendingPaymentMethods;

  ABAInquiryMerchantResponseDataModel({
    this.outletName,
    this.abaAccountKhr,
    this.abaAccountUsd,
    this.availablePaymentMethods,
    this.enabledPaymentMethods,
    this.pendingPaymentMethods,
  });

  factory ABAInquiryMerchantResponseDataModel.fromJson(dynamic json) {
    return ABAInquiryMerchantResponseDataModel(
      outletName: json['outlet_name'],
      abaAccountKhr: json['aba_account_khr'],
      abaAccountUsd: json['aba_account_usd'],
      availablePaymentMethods: json['available_payment_methods'] != null ? Map<String, dynamic>.from(json['available_payment_methods']) : null,
      enabledPaymentMethods: json['enabled_payment_methods'] != null ? Map<String, dynamic>.from(json['enabled_payment_methods']) : null,
      pendingPaymentMethods: json['pending_payment_methods'] != null ? Map<String, dynamic>.from(json['pending_payment_methods']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'outlet_name': outletName,
      'aba_account_khr': abaAccountKhr,
      'aba_account_usd': abaAccountUsd,
      'available_payment_methods': availablePaymentMethods,
      'enabled_payment_methods': enabledPaymentMethods,
      'pending_payment_methods': pendingPaymentMethods,
    };
  }
}
