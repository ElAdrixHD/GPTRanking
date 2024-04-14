import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ranking_app/core/app/domain/models/env_vars.dart';
import 'package:ranking_app/core/app/ioc/locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}

@module
abstract class RegisterModule {
  @Singleton()
  EnvVars get getEnvVars => EnvVars();

  @Singleton()
  ProviderContainer get getProviderContainer => ProviderContainer();

  @Singleton()
  GlobalKey<ScaffoldMessengerState> get getScaffoldKey =>
      GlobalKey<ScaffoldMessengerState>();
}
