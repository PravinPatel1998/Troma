/*class GenericResponse<T> {
  int status;
  String message;
  T? data;

  GenericResponse({required this.status, this.data, required this.message});

  factory GenericResponse.fromJson(Map<String, dynamic> json) {
    return GenericResponse(
        status: json['status'], message: json['message'], data: json['data']);
  }
}

abstract class FromJsonModel<T> {
  T fromJsonHelp(Map<String, dynamic> json);

  static Type typeOf<T>() => T;
}*/

class GenericResponse<T> {
  int status;
  String errorMessage;
  T? data;

  GenericResponse(
      {required this.status, required this.errorMessage, this.data});

  factory GenericResponse.fromJson(Map<String, dynamic> response) {
    return GenericResponse(
      status: response['status'],
      errorMessage: response['message'],
      data: response['data'],
    );
  }
}
