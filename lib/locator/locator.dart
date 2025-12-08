import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:oauth2_auth_app/modules/auth/datasources/otp_service.dart';
import 'package:oauth2_auth_app/rest-client/rest_client.dart';
import 'package:oauth2_auth_app/locator/locator.config.dart';
import 'package:oauth2_auth_app/usecases/send_otp_usecase.dart';

final locator = GetIt.instance;

@injectableInit
Future<void> setupLocator() async {
  locator.init();
}

@module
abstract class Locator {
  @lazySingleton
  Dio getDio() => locator<RestClient>().dio;

  @lazySingleton
  SendOtpUseCase sendOtpUseCase(OTPService otpService) => SendOtpUseCase(otpService);
}
