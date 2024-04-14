import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class DioRestService {
  final String baseUrl;

  final List<Interceptor> interceptors;

  final void Function(DioException)? catchErrors;

  final int receiveTimeout;

  final int connectTimeout;

  final int sendTimeout;

  final List<int> validCodes;

  final Map<String, dynamic>? headers;

  @internal
  late Dio dio;

  DioRestService({
    required this.baseUrl,
    this.interceptors = const [],
    this.catchErrors,
    this.receiveTimeout = 15000,
    this.connectTimeout = 15000,
    this.sendTimeout = 15000,
    this.validCodes = const [200],
    this.headers,
  }) {
    _initClient();
  }

  _initClient() {
    final Dio initDio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: Duration(milliseconds: receiveTimeout),
        connectTimeout: Duration(milliseconds: connectTimeout),
        sendTimeout: Duration(milliseconds: sendTimeout),
        headers: headers,
        validateStatus: (int? code) => validCodes.contains(code),
      ),
    );

    if (interceptors.isNotEmpty) {
      initDio.interceptors.addAll(interceptors);
    }
    dio = initDio;
  }

  Future<T?> get<T>(
    String endpointPath, {
    Map<String, dynamic>? queryParam,
  }) async {
    return _tryCatch(
      () async {
        final response = await dio.get<T>(
          endpointPath,
          queryParameters: queryParam,
        );
        return response.data;
      },
    );
  }

  Future<T?> post<T>(
    String endpointPath, {
    data,
    Map<String, dynamic>? queryParam,
  }) async {
    return _tryCatch<T>(
      () async {
        final response = await dio.post<T>(
          endpointPath,
          data: data,
          queryParameters: queryParam,
        );
        return response.data;
      },
    );
  }

  Future<T?> put<T>(
    String endpointPath, {
    data,
    Map<String, dynamic>? queryParam,
  }) async {
    return _tryCatch<T>(
      () async {
        final response = await dio.put<T>(
          endpointPath,
          data: data,
          queryParameters: queryParam,
        );
        return response.data;
      },
    );
  }

  Future<T?> delete<T>(
    String endpointPath, {
    data,
    Map<String, dynamic>? queryParam,
  }) async {
    return _tryCatch<T>(
      () async {
        final response = await dio.delete<T>(
          endpointPath,
          data: data,
          queryParameters: queryParam,
        );
        return response.data;
      },
    );
  }

  Future<T?> patch<T>(
    String endpointPath, {
    data,
    Map<String, dynamic>? queryParam,
  }) async {
    return _tryCatch<T>(
      () async {
        final response = await dio.patch<T>(
          endpointPath,
          data: data,
          queryParameters: queryParam,
        );
        return response.data;
      },
    );
  }

  Future<T?> _tryCatch<T>(
    Future<T?> Function() function,
  ) async {
    try {
      return await function();
    } on DioException catch (e) {
      log('$runtimeType/DioError: ${e.error.toString()}');
      if (catchErrors == null) {
        rethrow;
      }
      catchErrors!(e);
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
