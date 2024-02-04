import 'package:cryptoapp/modules/domain/models/coin_response.dart';
import 'package:cryptoapp/modules/domain/services/service_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'coin_module.dart';

void main() async {
  // Set Up
  WidgetsFlutterBinding.ensureInitialized();
  const baseUrl = ServiceBase.baseUrl;
  final coinModule = CoinModule(baseUrl: baseUrl);
  // Process Testing
  group("API call Process:", () {
    test('get COIN', () async {
      dynamic response = await coinModule.getApiCoin(ServiceBase.API_KEY);

      expect(
        response,
        isNotNull,
        reason: 'response should not be null',
      );

      final responseOutput = CoinResponseData.fromJson(response);

      expect(
        responseOutput.data,
        isA<CoinResponseData>(),
        reason: 'response should be parsed to [CoinResponseData]',
      );

      expect(
        responseOutput,
        1,
        reason: 'Should have only one object in total',
      );
    });
  });
}
