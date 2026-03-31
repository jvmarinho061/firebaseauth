class CommentModel {
  final int id;
  final String body; // conteúdo do comentário

  //podem ser ignorados pois estou simulando 
  final int? postId;
  final String? name;
  final String? email;

  CommentModel({
    required this.id,
    required this.body,
    this.postId,
    this.name,
    this.email,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      body: json['body'],
      postId: json['postId'],
      name: json['name'],
      email: json['email'],
    );
  }

  CommentModel copyWith({
    int? id,
    String? body,
    int? postId,
    String? name,
    String? email, required String content,
  }) {
    return CommentModel(
      id: id ?? this.id,
      body: body ?? this.body,
      postId: postId ?? this.postId,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}