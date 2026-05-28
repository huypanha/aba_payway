enum ABAPaywayEnvironmentEnum { sandbox, production }

enum MxBankAccountTypeEnum {
  checking('Checking'),
  savings('Savings');

  final String name;
  const MxBankAccountTypeEnum(this.name);
}
