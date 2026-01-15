import 'package:dio/dio.dart';
import 'package:loginflutterteste/core/dio/dio_client.dart';

class AuthFirebaseDatarsource {
  final Dio dio = DioClient.dio;

  Future<Map<String, dynamic>> getUserProfile() async {
    final response = await dio.get('/posts');
    return response.data;
  }
}