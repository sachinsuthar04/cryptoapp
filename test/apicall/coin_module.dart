import 'package:cryptoapp/modules/domain/models/coin_response.dart';
import 'package:cryptoapp/modules/domain/services/service_base.dart';
import 'package:cryptoapp/resources/endpoints.dart';

class CoinModule {
  final String baseUrl;
  dynamic sendOtpResponse;
  dynamic token;

  CoinModule({required this.baseUrl});

  /// Send OTP
  Future<dynamic> getApiCoin(String apiKey) async {
    dynamic response = await ServiceBase.get(
        url: '$baseUrl${Endpoints.getCryptocurrency}?&start=1&limit=10',
        headers: {
          'X-CMC_PRO_API_KEY': apiKey,
          'Content-Type': 'application/json',
        });

    sendOtpResponse = CoinResponseData.fromJson(response);

    return response;
  }
}
