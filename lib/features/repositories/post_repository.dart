import 'package:dio/dio.dart';
import 'package:loginflutterteste/core/dio/dio_client.dart';
import 'package:loginflutterteste/models/comment_model.dart';
import 'package:loginflutterteste/models/postModel.dart';

class PostRepository {
  final DioClient dioClient;
  PostRepository(this.dioClient);

  //metodo de busca de todos os post
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await DioClient.dio.get('/posts');
      return (response.data as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
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

  Future<List<CommentModel>> getComments(int postId) async {
    try {
    final response = await DioClient.dio.get('/post/$postId/comments');
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  } on DioException catch (e) {
    throw Exception('Erro ao buscar comentários do post: ${e.message}');
  }
  }
}
