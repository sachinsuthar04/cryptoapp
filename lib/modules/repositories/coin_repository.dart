import 'package:cryptoapp/modules/domain/models/coin_response.dart';
import 'package:cryptoapp/modules/domain/services/service_base.dart';
import 'package:cryptoapp/resources/endpoints.dart';
import 'package:hive/hive.dart';

/// We use this repo for add methods where we set as mediator for data access
///
class CoinRepository {
  final ServiceBase serviceBase = ServiceBase();

  // API call
  Future<List<CoinResponse>> getCoins(int count) async {
    try {
      final response = await ServiceBase.get(
          url:
              "${ServiceBase.baseUrl}${Endpoints.getCryptocurrency}?&start=$count&limit=10",
          headers: {
            'X-CMC_PRO_API_KEY': ServiceBase.API_KEY,
            'Content-Type': 'application/json',
          });
      List<CoinResponse> value = <CoinResponse>[];
      for (var element in response['data']) {
        value.add(CoinResponse.fromJson(element));
      }
      return value;
    } catch (e) {
      rethrow;
    }
  }

  // Get data from database
  Future<List<CoinResponse>> getCoinsFromDB() async {
    try {
      final coinData = Hive.box('crypto');
      List<CoinResponse> value = <CoinResponse>[];

      final data = coinData.keys.map((key) {
        final value = coinData.get(key);
        return {
          "key": key ?? 0,
          "id": value["id"],
          "name": value["name"],
          "symbol": value['symbol'],
          "rank": value['rank'],
          "first_historical_data": value["firstHistoricalData"],
          "last_historical_data": value["lastHistoricalData"],
          "platform": value["platform"],
        };
      }).toList();

      for (var element in data) {
        value.add(CoinResponse.fromJson(element));
      }
      return value;
    } catch (e) {
      rethrow;
    }
  }

  // Add data to favourite
  Future<List<CoinResponse>> addFavouriteData(CoinResponse coinResponse) async {
    try {
      final coinData = Hive.box('crypto');
      List<CoinResponse> value = <CoinResponse>[];
      Map<String, dynamic> newItem = {
        "id": coinResponse.id,
        "name": coinResponse.name,
        "symbol": coinResponse.symbol,
        "rank": coinResponse.rank,
        "first_historical_data": coinResponse.firstHistoricalData,
        "last_historical_data": coinResponse.lastHistoricalData,
        "platform": coinResponse.platform.toJson(),
      };
      await coinData.add(newItem);

      return value;
    } catch (e) {
      rethrow;
    }
  }

  // remove data from favourite
  Future<List<CoinResponse>> deleteFavouriteData(int key) async {
    try {
      final coinData = Hive.box('crypto');
      List<CoinResponse> value = <CoinResponse>[];

      await coinData.delete(key);

      final data = coinData.keys.map((key) {
        final value = coinData.get(key);
        return {
          "key": key,
          "id": value["id"],
          "name": value["name"],
          "symbol": value['symbol'],
          "rank": value['rank'],
          "first_historical_data": value["firstHistoricalData"],
          "last_historical_data": value["lastHistoricalData"],
          "platform": value["platform"],
        };
      }).toList();
      for (var element in data) {
        value.add(CoinResponse.fromJson(element));
      }
      return value;
    } catch (e) {
      rethrow;
    }
  }
}
