// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:oauth2_auth_app/locator/locator.dart' as _i145;
import 'package:oauth2_auth_app/modules/auth/datasources/otp_service.dart'
    as _i61;
import 'package:oauth2_auth_app/usecases/send_otp_usecase.dart' as _i867;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final locator = _$Locator();
    gh.lazySingleton<_i361.Dio>(() => locator.getDio());
    gh.lazySingleton<_i61.OTPService>(() => _i61.OTPService(gh<_i361.Dio>()));
    gh.lazySingleton<_i867.SendOtpUseCase>(
      () => locator.sendOtpUseCase(gh<_i61.OTPService>()),
    );
    return this;
  }
}

class _$Locator extends _i145.Locator {}
