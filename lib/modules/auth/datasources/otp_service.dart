import 'package:dio/dio.dart';
import 'package:oauth2_auth_app/config/config.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'otp_service.g.dart';

@RestApi(baseUrl: "${Config.baseUrl}/api/v1")
@lazySingleton
abstract class OTPService {
  @factoryMethod
  factory OTPService(Dio dio) = _OTPService;

  @POST("/otp")
  Future<void> sendOtp(@Body() Map<String, String> param);

}
