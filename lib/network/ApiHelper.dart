import 'package:dio/dio.dart';
import 'package:troma_demo/network/DioHelper.dart';

import 'GenricClass.dart';

class ApiHelper {
  var dio = DioHelper().getDio();

  /* Future<GenericResponse<dynamic>> getApi({required String url}) async {
    Response<dynamic> response = await dio.get(url);
    return response.data;
  }*/

  Options options(isAuthRequired) {
    if (isAuthRequired) {
      return Options(contentType: "application/json", headers: {
        "auth":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzM3MGJjNGY0NGVhNTlhZGZhNTgzZGIiLCJpYXQiOjE3MzMyMDcyOTV9.QXS3QllxZEMh5snEGcrmJ5F8vVC-TWcip9o579gFnqw"
      });
    } else {
      return Options();
    }
  }

  Future<dynamic> getApi({required String url}) async {
    Response response = await dio.get(url);
    return response.data;
  }

  /// GET API
  /// https://api-llynkup.appworkdemo.com/api/seller/product-category-list
  Future<Response<GenericResponse>> getGeneric(
      {required String url, bool isAuthRequired = false}) async {
    Response response = await dio.get(url, options: options(isAuthRequired));

    Response<GenericResponse> result = Response<GenericResponse>(
        data: GenericResponse.fromJson(response.data as Map<String, dynamic>),
        requestOptions: response.requestOptions,
        extra: response.extra,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage);

    return result;
  }

  Future<dynamic> postApi(
      {required String url,
      Object? object,
      bool isAuthRequired = false}) async {
    Response response =
        await dio.post(url, data: object, options: options(isAuthRequired));
    return response.data;
  }
}
