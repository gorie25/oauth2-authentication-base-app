import 'package:oauth2_auth_app/modules/auth/datasources/otp_service.dart';

class SendOtpUseCase {
  final OTPService otpService;
  SendOtpUseCase(this.otpService);
  Future<void> run({required String phoneNumber, required String locale}) async {
    await otpService.sendOtp(({'phone_number': phoneNumber, 'locale': locale}));
  }
}
