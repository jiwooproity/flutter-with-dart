import 'package:dio/dio.dart';

class DioSingle {
  static final _instance = DioSingle._internal();
  late final Dio _dio;

  factory DioSingle() => _instance;

  static final _options = BaseOptions(
    baseUrl: "http://10.0.2.2:8080",
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  );

  DioSingle._internal() {
    _dio = Dio(_options);
    _initInterceptor();
  }

  void _initInterceptor() {
    _dio.interceptors.add(LogInterceptor());
  }
}
