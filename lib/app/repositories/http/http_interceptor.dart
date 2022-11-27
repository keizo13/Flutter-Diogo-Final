import 'package:dio/dio.dart';

class HttpInterceptor extends InterceptorsWrapper {
  Dio dio;

  // UserModel user = Modular.get();

  HttpInterceptor({required this.dio});

  // @override
  // onRequest(options, handler) async {
  //   if (user.token != null || user.token != '') {
  //     options.headers['Authorization'] = 'Bearer ${user.token}';
  //   }

  //   return handler.next(options);
  // }
}
