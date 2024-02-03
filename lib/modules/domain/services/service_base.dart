import 'dart:async' show Future;
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cryptoapp/modules/domain/error_config.dart';
import 'package:http/http.dart' as http;

class ServiceBase {
  static const String baseUrl = "https://pro-api.coinmarketcap.com";
  static const String API_KEY = "2592e201-7cb0-41b4-81d5-abacc60ac4ee";

  // default message for reponse code 500
  static const internalServerError = "Internal Server Error";
  static const somethingWentWrong = "Something Went Wrong";

  // timeout duration
  static const timeout = Duration(seconds: 20);

  final String? apiBaseUrl;

  static ServiceBase? _singleton;

  factory ServiceBase({apiBaseUrl}) {
    _singleton ??= ServiceBase._(apiBaseUrl: apiBaseUrl);
    return _singleton!;
  }

  ServiceBase._({this.apiBaseUrl});

  static String? getApiBaseUrl() {
    return _singleton!.apiBaseUrl;
  }

  static Future<bool> checkConnectionStatus() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Future<Map<String, dynamic>> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    final client = http.Client();

    // Check for internet connection
    final connectivity = await checkConnectionStatus();

    // handle internet connectivity
    if (connectivity) {
      // Api call
      late final dynamic response;
      try {
        response = await client.get(
          Uri.parse(url),
          headers: headers,
        );
      } catch (e) {
        throw ErrorConfiguration.unreachable;
      }

      if (int.parse(response.statusCode.toString()[0]) == 2) {
        client.close();
        // return the api response
        return jsonDecode(response.body);
      } else {
        handlerError(response, client);
      }
    }
    throw "No Internet Connection";
  }

  /// This handles all the reponses other than success response
  static void handlerError(http.Response response, http.Client client) {
    client.close();
    if (int.parse(response.statusCode.toString()[0]) == 5) {
      switch (response.statusCode) {
        case 500:
          throw ErrorConfiguration.internalServerError;
        case 501:
          throw ErrorConfiguration.internalServerError;
        case 502:
          throw ErrorConfiguration.badGateway;
        default:
          throw ErrorConfiguration.internalServerError;
      }
    }
    if (int.parse(response.statusCode.toString()[0]) == 4) {
      switch (response.statusCode) {
        case 401:
          throw ErrorConfiguration.unAuthorised;
        case 403:
          throw ErrorConfiguration.unAuthorised;
        case 404:
          final message = getMessage(response);
          throw message;
        default:
          throw {
            'status_code': response.statusCode,
            'body': jsonDecode(response.body),
          };
      }
    } else {
      // Throw Error message got from the api
      throw {
        'status_code': response.statusCode,
        'body': jsonDecode(response.body),
      };
    }
  }

  static dynamic getMessage(http.Response response) {
    final contentType = response.headers.entries
        .firstWhere((element) => element.key == 'content-type')
        .value;
    if (contentType.contains('json')) {
      return {
        'status_code': response.statusCode,
        'body': jsonDecode(response.body),
      };
    } else {
      return ErrorConfiguration.notFound;
    }
  }
}
