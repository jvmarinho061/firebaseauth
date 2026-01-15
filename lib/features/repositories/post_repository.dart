import 'package:dio/dio.dart';
import 'package:loginflutterteste/core/dio/dio_client.dart';
import 'package:loginflutterteste/models/postModel.dart';

class PostRepository {
  final DioClient dioClient;
  PostRepository(this.dioClient);

  //metodo de busca de todos os post
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await DioClient.dio.get('/posts');
      return (response.data as List)
          .map((post) => PostModel.fromJson(post)).toList(); 
    } on DioException catch (e) {
      throw Exception('Erro ao buscar posts: ${e.message}');
    }
  }

  Future<PostModel> getPostDetails(int id) async {
    try {
      final response = await DioClient.dio.get('posts/$id');
      return PostModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Erro ao buscar detalhes do post: ${e.message}');
    }
  }
}