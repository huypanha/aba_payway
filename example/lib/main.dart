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
  final _txtPublicKey = TextEditingController(text: '');
  final _txtPrivateKey = TextEditingController(text: '');
  final _txtPartnerId = TextEditingController(text: '');
  final _txtReferer = TextEditingController(text: '');

  @override
  void dispose() {
    _txtPublicKey.dispose();
    _txtPrivateKey.dispose();
    _txtPartnerId.dispose();
    _txtReferer.dispose();
    super.dispose();
  }

  Future partner() async {
    final abaPayway = ABAPayway(
      publicKey: _txtPublicKey.text,
      privateKey: _txtPrivateKey.text,
      merchantId: 'EC0001',
      env: .sandbox,
      partnerId: _txtPartnerId.text,
      partnerReferer: _txtReferer.text,
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
    launchUrl(Uri.parse(registerResponse.status.toString()));

    final getMerchantByRef = await abaPayway.partner.getMerchantByRegisterRef('Merchant001');
    log('getMerchantByRef = ${getMerchantByRef.data?.toJson()}');
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
