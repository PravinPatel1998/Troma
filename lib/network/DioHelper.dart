import 'package:dio/dio.dart';

class DioHelper {
  var dio = Dio();

  Dio getDio() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions option, handler) {
      print("Url ::  ${option.uri}");
      print("header ::  ${option.headers}");

      handler.next(option);
    }, onResponse: (Response response, handler) {
      print("Response : ${response.data}");
      handler.next(response);
    }, onError: (e, handler) {
      print("Error : ${e.message}");
      handler.next(e);
    }));

    return dio;
  }
}
