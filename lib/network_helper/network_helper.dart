import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:troma_demo/network/GenricClass.dart';

import '../utils/utils.dart';

Dio getDio() {
  Dio dio = Dio();

  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
    printValue(tag: 'API URL:', '${options.uri}');
    printValue(tag: 'HEADER:', options.headers);

    try {
      printValue(tag: 'REQUEST BODY: ', jsonEncode(options.data));
    } catch (e) {
      printValue(tag: 'REQUEST BODY ERROR: ', e.toString());
    }

    return handler.next(options);
  }, onResponse: (Response response, ResponseInterceptorHandler handler) {
    printValue(tag: 'API RESPONSE:', response.data);
    return handler.next(response);
  }, onError: (DioException e, handler) {
    printValue(tag: 'STATUS CODE:', "${e.response?.statusCode ?? ""}");
    printValue(tag: 'ERROR DATA :', e.response?.data ?? "");
    if (e.response?.statusCode == 401) {
      // Navigate here
      // StorageHelper().clear();
      // navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context) => const ()));
      Fluttertoast.showToast(msg: "401 Unauthorized");
    } else if (e.response?.statusCode == 400) {
      // toast
    }

    return handler.next(e);
  }));
  return dio;
}

class DioHelper {
  Dio dio = getDio();

  Options options(bool isAuthRequired) {
    if (isAuthRequired) {
      return Options(
          receiveDataWhenStatusError: true,
          contentType: "application/json",
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            "auth":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzM3MGJjNGY0NGVhNTlhZGZhNTgzZGIiLCJpYXQiOjE3MzMyMDcyOTV9.QXS3QllxZEMh5snEGcrmJ5F8vVC-TWcip9o579gFnqw"
          }
          // headers: {"Authorization": 'Bearer ${StorageHelper().getUserAccessToken()}'},
          );
    } else {
      return Options(
        receiveDataWhenStatusError: true,
        contentType: "application/json",
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
      );
    }
  }

  /// GET API
  Future<dynamic> get(
      {required String url, bool isAuthRequired = false}) async {
    try {
      Response response = await dio.get(url, options: options(isAuthRequired));
      return response.data;
    } catch (error) {
      return null;
    }
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

  /// POST API
  Future<dynamic> post(
      {required String url,
      Object? requestBody,
      bool isAuthRequired = false}) async {
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.post(url, options: options(isAuthRequired));
      } else {
        response = await dio.post(url,
            data: requestBody, options: options(isAuthRequired));
      }

      return response.data;
    } catch (error) {
      return null;
    }
  }

  /// PUT API
  Future<dynamic> put(
      {required String url,
      Object? requestBody,
      bool isAuthRequired = false}) async {
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.put(url, options: options(isAuthRequired));
      } else {
        response = await dio.put(url,
            data: requestBody, options: options(isAuthRequired));
      }

      return response.data;
    } catch (error) {
      return null;
    }
  }

  /// PATCH API
  Future<dynamic> patch(
      {required String url,
      Object? requestBody,
      bool isAuthRequired = false}) async {
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.patch(url, options: options(isAuthRequired));
      } else {
        response = await dio.patch(url,
            data: requestBody, options: options(isAuthRequired));
      }

      return response.data;
    } catch (error) {
      return null;
    }
  }

  /// DELETE API
  Future<dynamic> delete(
      {required String url,
      Object? requestBody,
      bool isAuthRequired = false}) async {
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.delete(url, options: options(isAuthRequired));
      } else {
        response = await dio.delete(url,
            data: requestBody, options: options(isAuthRequired));
      }

      return response.data;
    } catch (error) {
      return null;
    }
  }

  /// MULTIPART API
  Future<dynamic> uploadFile(
      {required String url,
      required Object requestBody,
      bool isAuthRequired = false}) async {
    Options option = Options(headers: {"Content-Type": "multipart/form-data"});

    try {
      Response response =
          await dio.post(url, data: requestBody, options: option);

      return response.data;
    } catch (error) {
      return null;
    }
  }
}
