import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ranking_app/core/app/data/services/dio_rest_service.dart';
import 'package:ranking_app/core/app/domain/models/env_vars.dart';

class ApiService extends DioRestService {
  ApiService({
    required super.baseUrl,
  }) : super(
          validCodes: [
            200,
          ],
          headers: {
            'Authorization': 'Bearer ${GetIt.I<EnvVars>().apiKey}',
          },
        );
}

@module
abstract class ApiServiceModule {
  @lazySingleton
  ApiService get httpClient => ApiService(
        baseUrl: GetIt.I<EnvVars>().apiUrl,
      );
}
