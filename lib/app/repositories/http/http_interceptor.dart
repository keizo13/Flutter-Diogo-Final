import 'package:dio/dio.dart';

// O interceptor é para implementar uma interceptação na Header da chamada do Dio API
class HttpInterceptor extends InterceptorsWrapper {
  Dio dio;

  HttpInterceptor({required this.dio});
}
//quando dio faz uma chamada faz um interceptador