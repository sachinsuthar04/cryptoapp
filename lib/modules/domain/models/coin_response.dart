// To parse this JSON data, do
//
//     final coinResponse = coinResponseFromJson(jsonString);

import 'dart:convert';

CoinResponseData coinResponseFromJson(String str) =>
    CoinResponseData.fromJson(json.decode(str));

String coinResponseToJson(CoinResponseData data) => json.encode(data.toJson());

class CoinResponseData {
  final Status status;
  final List<CoinResponse> data;

  CoinResponseData({
    required this.status,
    required this.data,
  });

  factory CoinResponseData.fromJson(Map<String, dynamic> json) =>
      CoinResponseData(
        status: Status.fromJson(json["status"]),
        data: List<CoinResponse>.from(
            json["data"].map((x) => CoinResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CoinResponse {
  final int? key;
  final int id;
  final int rank;
  final String name;
  final String symbol;
  final String slug;
  final int isActive;
  final DateTime firstHistoricalData;
  final DateTime lastHistoricalData;
  final Platform platform;

  CoinResponse({
    required this.key,
    required this.id,
    required this.rank,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.isActive,
    required this.firstHistoricalData,
    required this.lastHistoricalData,
    required this.platform,
  });

  factory CoinResponse.fromJson(Map<String, dynamic> json) => CoinResponse(
        key: json["key"],
        id: json["id"] ?? 0,
        rank: json["rank"] ?? "",
        name: json["name"] ?? "",
        symbol: json["symbol"] ?? "",
        slug: json["slug"] ?? "",
        isActive: json["is_active"] ?? 0,
        firstHistoricalData: json["first_historical_data"] != null
            ? DateTime.parse(json["first_historical_data"])
            : DateTime.now(),
        lastHistoricalData: json["last_historical_data"] != null
            ? DateTime.parse(json["last_historical_data"])
            : DateTime.now(),
        platform: json["platform"] != null
            ? Platform.fromJson(json["platform"])
            : Platform.fromJson(Map()),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "id": id,
        "rank": rank,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "is_active": isActive,
        "first_historical_data": firstHistoricalData.toIso8601String(),
        "last_historical_data": lastHistoricalData.toIso8601String(),
        "platform": platform.toJson(),
      };
}

class Platform {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final String tokenAddress;

  Platform({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.tokenAddress,
  });

  factory Platform.fromJson(Map<dynamic, dynamic> json) => Platform(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        symbol: json["symbol"] ?? "",
        slug: json["slug"] ?? "",
        tokenAddress: json["token_address"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "token_address": tokenAddress,
      };
}

class Status {
  final DateTime timestamp;
  final int errorCode;
  final dynamic errorMessage;
  final int elapsed;
  final int creditCount;
  final dynamic notice;

  Status({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
    required this.notice,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: json["timestamp"] != null
            ? DateTime.parse(json["timestamp"])
            : DateTime.now(),
        errorCode: json["error_code"] ?? 0,
        errorMessage: json["error_message"] ?? "",
        elapsed: json["elapsed"] ?? 0,
        creditCount: json["credit_count"] ?? "",
        notice: json["notice"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
      };
}
