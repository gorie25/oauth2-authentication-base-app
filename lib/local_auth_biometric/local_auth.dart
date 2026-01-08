import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> canCheckBio() async {
    final canCheckBiometrics = await _auth.canCheckBiometrics;
    final availableBiometrics = await _auth.getAvailableBiometrics();
    print('Avaliable biometrics: ${availableBiometrics}');
    print('Can check biometrics: $canCheckBiometrics');
    return canCheckBiometrics;
  }

  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(localizedReason: 'Please authenticate to proceed', biometricOnly: true, sensitiveTransaction: true);
    } on LocalAuthException catch (e) {
      print(e);
      return false;
    }
  }
}
