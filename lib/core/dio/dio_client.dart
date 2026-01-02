import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DioClient {
  static Dio getDio() {
    final dio = Dio(
      BaseOptions(baseUrl:'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            final token = await user.getIdToken();
            options.headers['Authorization'] = 'Bearer $token';
          }
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            print('Usuário não atorizado');
          }
          return handler.next(error);
        },
      ));
      return dio;
  }
}