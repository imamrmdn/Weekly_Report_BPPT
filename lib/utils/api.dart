import 'package:dio/dio.dart';

final options =
    BaseOptions(baseUrl: "https://stark-wildwood-18722.herokuapp.com");

final api = new Dio(options);

class Api {
  static void setDefaultAuthHeader(String jwt) {
    api.options.headers = {'Authorization': jwt};
  }

  static void removeDefaultAuthHeader() {
    api.options.headers = {
      'Authorization': '',
    };
  }
}
