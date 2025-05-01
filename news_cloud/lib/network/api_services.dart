import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();
  //$apiKey

  get({required String endpoint}) async {
    var response = await dio.get(endpoint);
    return response.data;
  }

  Future<Map<String, dynamic>> post({required String endpoint}) async {
    var response = await dio.post(endpoint);
    return response.data;
  }
}
