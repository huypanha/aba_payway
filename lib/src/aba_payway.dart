import 'package:aba_payway/src/services/api_service.dart';
import 'package:aba_payway/src/services/partner/partner_service.dart';
import 'package:aba_payway/src/services/partner/partner_service_impl.dart';
import 'package:aba_payway/src/utils/enums.dart';

class ABAPayway {
  late ApiService _apiService;
  late ABAPartnerService partner;

  ABAPayway({
    required String privateKey,
    required String publicKey,
    String merchantId = '',
    String partnerId = '',
    String partnerReferer = '',
    ABAPaywayEnvironmentEnum env = .sandbox,
  }) {
    _apiService = ApiService(
      privateKey: privateKey,
      publicKey: publicKey,
      partnerId: partnerId,
      partnerReferer: partnerReferer,
      env: env,
      merchantId: merchantId,
    );
    partner = ABAPartnerServiceImpl(_apiService);
  }
}
