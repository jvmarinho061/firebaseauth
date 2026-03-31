import 'package:loginflutterteste/models/postModel.dart';

abstract class PostEvent {}

class FetchPosts extends PostEvent {}

class FetchPostDetails extends PostEvent {
  final int id;
  FetchPostDetails(this.id);
}

class ToggleLikePost extends PostEvent {
  final PostModel post;
  ToggleLikePost(this.post);
}

class FetchComments extends PostEvent {
  final int postId;
  FetchComments(this.postId);
}

class AddComment extends PostEvent {
  final int postId;
  final String commentText;
  AddComment(this.postId, this.commentText);
  get comment => null;
}

class EditComment extends PostEvent {
  final int postId;
  final int commentId;
  final String newContent;
  EditComment(this.postId, this.commentId, this.newContent);
}

class DeleteComment extends PostEvent {
  final int postId;
  final int commentId;
  DeleteComment(this.postId, this.commentId);
}

class DeletePost extends PostEvent {
  final int postId;
  DeletePost(this.postId);
}
