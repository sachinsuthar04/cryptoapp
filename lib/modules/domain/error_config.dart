class ErrorConfiguration {
  // 4XX response codes
  // ============================================================
  // code: 401/403
  static const String unAuthorised = "Session Expired";

  static const String notFound = "No Data Found";

  // ============================================================
  // 4XX response codes

  // 5XX response codes
  // ============================================================
  // code: 500
  static const String internalServerError = "Something went wrong";

  // code: 501
  static const String notSupported = "Service not supportee";

  // code: 502
  static const String badGateway = "Server Not Reachable";

  // code: 503 | Service Unavailable
  static const String serviceUnavailable = "Service unavailable";

  // ============================================================
  // 5XX response codes

  // code: INTERNET UNAVALABLE
  static const String noInternet = "No Internet Connection";

  // whenever API fails
  static const String unreachable = "Service not reachable";
}
