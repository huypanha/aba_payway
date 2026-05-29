# ABA Payway

A Flutter plugin for the ABA PayWay merchant payment gateway, supporting partner registration and self-activation onboarding in Cambodia.

This package enables partners to integrate ABA PayWay self-activation capabilities within their Flutter applications, allowing merchants to onboard online or in-store with custom configuration, currency (USD/KHR), and environment support (Sandbox & Production).

## Features

- **Partner Integration**: Streamline merchant registration directly through your platform.
- **Secure Communication**: Secure payload encryption via OpenSSL/RSA and dynamic cryptographic hash generation.
- **Environment Support**: Easy toggling between sandbox and production environments.
- **Merchant Lookup**: Query registered merchant credentials and onboarding status using unique registration references.
- **Flexible Configuration**: Supports multi-currency (USD, KHR), activation platform sources (Web, Native App), and merchant types (In-Store, Online).

## Getting Started

### Prerequisites

To use this package, you need to obtain credentials from the ABA PayWay team:
- **Private Key**
- **Public Key**
- **Partner ID**
- **Partner Referer** (registered domain/referer header)

### Installation

Add `aba_payway` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  aba_payway: <latest_version>
```

Run the package installation command:

```bash
flutter pub get
```

## Usage

### 1. Initialize the Client

Instantiate the `ABAPayway` client with your credentials and choose your environment (sandbox or production).

```dart
import 'package:aba_payway/aba_payway.dart';

final abaPayway = ABAPayway(
  publicKey: 'YOUR_PUBLIC_KEY',
  privateKey: 'YOUR_PRIVATE_KEY',
  partnerId: 'YOUR_PARTNER_ID',
  partnerReferer: 'YOUR_PARTNER_REFERER',
  env: .sandbox, // or .production
);
```

### 2. Register a Merchant (Self-Activation)

Create a request to onboard a new merchant. This returns an onboarding URL and a session token.

```dart
final response = await abaPayway.partner.registerMerchant(
  ABARegisterMerchantRequestModel(
    registerRef: 'UNIQUE_MERCHANT_REF_001',
    pushbackUrl: 'https://webhook.yourdomain.com/payway-pushback',
    redirectUrl: 'https://yourdomain.com/onboarding-complete',
    currency: .usd,
    type: .web,
    merchantType: .online,
  ),
);

if (response.status.code == '00') {
  final onboardingUrl = response.url;
  final sessionToken = response.token;
  
  // Redirect your user to the onboardingUrl to complete their registration.
  print('Onboarding URL: $onboardingUrl');
} else {
  print('Error: ${response.status.message}');
}
```

### 3. Retrieve Merchant Credentials and Status

Check the status and obtain credentials of a registered merchant using the registration reference:

```dart
try {
  final result = await abaPayway.partner.getMerchantByRegisterRef('UNIQUE_MERCHANT_REF_001');
  
  if (result.status.code == '00') {
    final merchantData = result.data;
    print('Merchant Data: ${merchantData?.toJson()}');
  } else {
    print('Status Info: ${result.status.message}');
  }
} on ABAException catch (e) {
  print('ABA Error: ${e.message} (Code: ${e.errorCode})');
} catch (e) {
  print('Unexpected error: $e');
}
```

## Additional Information

- **Official Developer Portal**: Visit [ABA PayWay Developer Documentation](https://developer.payway.com.kh) for full details on API requirements, parameters, and workflows.
- **Reporting Issues**: Report bugs or feature requests on the [GitHub Issue Tracker](https://github.com/huypanha/aba_payway/issues).
- **Contributing**: Contributions are welcome. Please open a pull request or submit an issue to suggest improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
