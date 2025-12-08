import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static final Config _instance = Config._internal();

  factory Config() {
    return _instance;
  }

  Config._internal();

  static late String clientId;
  static late String clientSecret;
  static late String authorizationEndpoint;
  static const String baseUrl = "https://26134.vps-dev02-ssl.teanis.xyz";

  Future<void> loadFromEnv() async {
    await dotenv.load();

    clientId = dotenv.env['CLIENT_ID'] ?? '';
    clientSecret = dotenv.env['CLIENT_SECRET'] ?? '';
    authorizationEndpoint = dotenv.env['AUTHORIZATION_ENDPOINT'] ?? '';
  }
}
