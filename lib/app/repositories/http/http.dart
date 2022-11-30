import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core/interface/http_interface.dart';
import 'http_interceptor.dart';

// um modulo de configuracao dos metodos pego na internet
class Http implements HttpInterface {
  late final Dio dio;

  Http({required this.dio}) {
    dio.interceptors.add(HttpInterceptor(dio: dio));
  }

  final defaultError = {
    "code": "INTERNAL_SERVER_ERROR",
    "execution": DateTime.now().toString(),
    "message": "Erro interno, tente novamente mais tarde.",
    "thread": "",
  };

  @override
  Future get(
    String endpoint, {
    required Map<String, dynamic> queryParameters,
    Options? options,
  }) async {
    try {
      return await dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioError catch (e) {
      if (e.response == null) {
        throw (defaultError);
      }

      Map response;
      if (options == null) {
        response = json.decode(e.response.toString());
      } else {
        var item = utf8.decode(e.response?.data);
        response = json.decode(item);
      }

      throw (response);
    }
  }

  @override
  Future post(
    String endpoint, {
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dio.post(endpoint, data: data);
    } on DioError catch (e) {
      if (e.response == null) {
        throw (defaultError);
      }

      final Map response = json.decode(e.response.toString());
      throw (response);
    }
  }

  @override
  Future put(String endpoint, {required Map<String, dynamic> data}) async {
    try {
      return await dio.put(endpoint, data: data);
    } on DioError catch (e) {
      if (e.response == null || e.response?.statusCode == 500) {
        throw (defaultError);
      }

      final Map response = json.decode(e.response.toString());
      throw (response);
    }
  }

  @override
  Future delete(String endpoint, {required Map<String, dynamic> data}) async {
    try {
      return await dio.delete(endpoint, data: data);
    } on DioError catch (e) {
      if (e.response == null) {
        throw (defaultError);
      }

      final Map response = json.decode(e.response.toString());
      throw (response);
    }
  }
}
