import 'package:dio/dio.dart';
import 'package:oauth2_auth_app/storage/spref.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RestClient {
  Dio dio = Dio();

  Future<void> _configDioInterceptors() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SPref.instance.getAccessToken();
          options.headers["Authorization"] = "Bearer $token";
          options.headers["Accept"] = "application/json";
          options.headers["X-Language"] = "vn";
          options.headers["X-Platform"] = "mobile";
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) {
          // Handle errors here
          return handler.next(e);
        },
      ),
    );
  }

  RestClient() {
    _configDioInterceptors();
  }
}
