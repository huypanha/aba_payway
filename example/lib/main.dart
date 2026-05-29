import 'dart:developer';

import 'package:aba_payway/aba_payway.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ABAPaywayExampleApp());
}

class ABAPaywayExampleApp extends StatelessWidget {
  const ABAPaywayExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ABA Payway Example', home: const ABAPaywayHomePage());
  }
}

class ABAPaywayHomePage extends StatefulWidget {
  const ABAPaywayHomePage({super.key});

  @override
  State<ABAPaywayHomePage> createState() => _ABAPaywayHomePageState();
}

class _ABAPaywayHomePageState extends State<ABAPaywayHomePage> with TickerProviderStateMixin {
  Future partner() async {
    final abaPayway = ABAPayway(
      publicKey: 'YOUR_PUBLIC_KEY',
      privateKey: 'YOUR_PRIVATE_KEY',
      partnerId: 'YOUR_PARTNER_ID',
      partnerReferer: 'YOUR_PARTNER_REFERER',
      env: .sandbox, // or .production
    );

    // Register a merchant
    final registerResponse = await abaPayway.partner.registerMerchant(
      ABARegisterMerchantRequestModel(
        pushbackUrl: 'https://webhook.example.com',
        redirectUrl: 'https://example.com',
        registerRef: 'Merchant001',
        currency: .usd,
        type: .web,
        merchantType: .inStore,
      ),
    );
    log('registerResponse = ${registerResponse.toJson()}');
    if (await canLaunchUrl(Uri.parse(registerResponse.status.toString()))) {
      await launchUrl(Uri.parse(registerResponse.status.toString()));
    }

    final getMerchantByRef = await abaPayway.partner.inquiryMerchantByRef('Merchant001');
    log('getMerchantByRef = ${getMerchantByRef.data?.toJson()}');

    final getMerchantByKey = await abaPayway.partner.inquiryMerchantByKey(
      ABAInquiryMerchantByKeyRequestModel(merchantKey: 'ec000002', apiKey: 'f38cdeba-b3832-37377-b15c-XXXXXXXXXXXX'),
    );
    log('getMerchantByKey = ${getMerchantByKey.data?.toJson()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABA Payway Example'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: Placeholder(),
    );
  }
}
