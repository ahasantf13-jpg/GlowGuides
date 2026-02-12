import 'package:dio/dio.dart';
import 'package:glowguide/core/databases/api/api_consumer.dart';
import 'package:glowguide/core/databases/api/end_points.dart';
import 'package:glowguide/core/errors/exceptions/dio_exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      ..responseType = ResponseType.json;

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: (object) => print(object),
      ),
    );
  }

  @override
  Future<dynamic> get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      Options? options}) async {
    try {
      final response = await dio.post(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> patch(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      Options? options}) async {
    try {
      final response = await dio.patch(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      Options? options}) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
