import 'package:aba_payway/src/services/api_service.dart';
import 'package:aba_payway/src/utils/enums.dart';

class MxMerchant {
  late ApiService _apiService;

  MxMerchant({required String privateKey, ABAPaywayEnvironmentEnum env = .sandbox}) {
    _apiService = ApiService(privateKey: privateKey, env: env);
  }
}
