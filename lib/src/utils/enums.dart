enum ABAPaywayEnvironmentEnum { sandbox, production }

enum ABAActivationPlatformSourceEnum { web, nativeApp }

enum ABAMerchantTypeEnum { inStore, online }

enum ABACurrencyEnum {
  khr('KHR'),
  usd('USD');

  final String name;
  const ABACurrencyEnum(this.name);
}
