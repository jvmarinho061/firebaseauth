import 'package:loginflutterteste/models/postModel.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel> posts;

  PostLoaded(this.posts);
}

class PostDetailsLoaded extends PostState {
  final PostModel post;

  PostDetailsLoaded(this.post);
}

class PostError extends PostState {
  final String message;

  PostError(this.message);
}
