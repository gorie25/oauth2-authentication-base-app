import 'package:oauth2_auth_app/storage/spref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPref {
  static final SPref instance = SPref._internal();

  SPref._internal();

  Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SPrefKey.keyAccessToken);
  }

  Future setAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SPrefKey.keyAccessToken, token);
  }

  Future<String?> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SPrefKey.keySavePassword);
  }

  Future setPassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SPrefKey.keySavePassword, password);
  }
}
