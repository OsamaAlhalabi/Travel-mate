import 'package:dio/dio.dart';

class ApiRequest {
  late final String url;
  late final data;
  late final header;

  ApiRequest({required this.url, required this.data, required this.header});
  
  Dio _dio() {
    return Dio(BaseOptions(headers: header));
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio().get(this.url, queryParameters: this.data).then((result) {
      if (onSuccess != null) onSuccess(result.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void post({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio().post(this.url, data: this.data).then((result) {
      if (onSuccess != null) onSuccess(result.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

}
