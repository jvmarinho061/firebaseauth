
import 'package:loginflutterteste/models/comment_model.dart';

class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  final bool isLiked;
  final List<CommentModel> comments;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    this.isLiked = false,
    this.comments = const []
  });

  PostModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
    bool? isLiked,
    List<CommentModel>? comments
  }) {
    return PostModel(
      userId: userId ?? this.userId, 
      id: id ?? this.id, 
      title: title ?? this.title, 
      body: body ?? this.body,
      isLiked: isLiked ?? this.isLiked,
      comments: comments ?? this.comments,
      );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json ['userId'], 
      id: json['id'], 
      title: json['title'], 
      body: json['body'],
      isLiked: json['isLiked'] ?? false
      );
  }
}