import 'package:dio/dio.dart';

class NetworkCommon {
  static final NetworkCommon _singleton = new NetworkCommon._internal();
  static const baseUrl = 'https://fakestoreapi.com/';

  factory NetworkCommon() {
    return _singleton;
  }

  NetworkCommon._internal();

  Dio get dio {
    Dio dio = new Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      //set base url
      options.baseUrl = '$baseUrl';

      return options;
    }));

    return dio;
  }

  static String handleError(DioError error) {
    String errorDescription = "Unexpected error occured";

    switch (error.type) {
      case DioErrorType.CANCEL:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        errorDescription =
            "Received invalid status code: ${error.response.statusCode}";
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = "Timeout in milliseconds for sending data";
        break;
    }

    return errorDescription;
  }
}
