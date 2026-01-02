import 'package:dio/dio.dart';
import 'package:loginflutterteste/core/dio/dio_client.dart';

class AuthFirebaseDatarsource {
  final Dio dio = DioClient.getDio();

  Future<Map<String, dynamic>> getUserProfile() async {
    final response = await dio.get('/posts');
    return response.data;
  }
}