import 'package:dio/dio.dart';

class Diohelper {
  late Dio dio;

  Diohelper() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://api.api-ninjas.com/v1/",
      connectTimeout: Duration(seconds: 20),
    );

    dio = Dio(options);
    dio.options.headers['X-Api-Key'] =
        '4vSdhegXZmg607sGTiiKxA==Kpj8ABqwb5MgWf0I';

    // Customize the validateStatus function to handle 400 status code as success
    dio.options.validateStatus = (status) {
      return status! < 500; // Consider 400 status code as success
    };
  }

  Future<Response> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
    String lang = "en",
    String? token,
  }) {
    return dio.get(path, queryParameters: queryParameters);
  }
}
