class ABAPartnerResponseStatusModel {
  /// Status code.
  ///
  /// - `00` : Success!
  /// - `PTL02` : Wrong Hash
  /// - `PTL04` : Parameter Validation Required
  /// - `PTL06` : The Request is Expired
  /// - `PTL141` : The redirect url can not empty.
  /// - `PTL142` : The pushback url can not empty.
  /// - `PTL137` : Partner id not found
  /// - `PTL165` : The register ref can not empty.
  /// - `PTL166` : The register ref is invalid format, we allow character and number with underscore or minus.
  /// - `PTL164` : The register ref is already exist.
  /// - `PTL171` : Please verify the key and the encryption method for the request data, as it appears to be invalid.
  /// - `PTL170` : Your profile is deactivated. Please contact integrationteam@ababank.com for more details.
  /// - `PTL175` : Requested Domain is not in whitelist.
  final String code;

  /// Please see the property response `code` for the details.
  final String message;

  ABAPartnerResponseStatusModel({required this.code, required this.message});

  factory ABAPartnerResponseStatusModel.fromJson(dynamic json) {
    return ABAPartnerResponseStatusModel(code: json['code'], message: json['message']);
  }

  bool get isSuccess => code == '00';

  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message};
  }
}
