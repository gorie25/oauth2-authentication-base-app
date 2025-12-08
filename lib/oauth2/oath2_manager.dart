import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:oauth2_auth_app/config/config.dart';
import 'package:oauth2_auth_app/storage/spref.dart';

class OAuth2Manager {
  final Uri authorizationEndpoint = Uri.parse(Config.authorizationEndpoint);
  final String clientId = Config.clientId;
  final String clientSecret = Config.clientSecret;
  Future<void> loginPasswordGrant(String phoneNumber, String otp) async {
    try {
      final value = await oauth2.resourceOwnerPasswordGrant(authorizationEndpoint, phoneNumber, otp, identifier: clientId, secret: clientSecret);
      _onAuthSuccess(value.credentials.accessToken);
    } catch (e) {
      if (e is oauth2.AuthorizationException) {
        throw Exception('AuthorizationException: $e');
      } else {
        throw Exception('Exception: $e');
      }
    }
  }

  void _onAuthSuccess(String accessToken) {
    SPref.instance.setAccessToken(accessToken);
  }
}
