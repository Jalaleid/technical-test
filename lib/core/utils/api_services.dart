import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'https://pokeapi.co/api/v2';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
