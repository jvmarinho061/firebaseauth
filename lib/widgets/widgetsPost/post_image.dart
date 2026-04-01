import 'package:flutter/material.dart';
import 'package:loginflutterteste/models/postModel.dart';

class PostImage extends StatelessWidget {
  final PostModel post;

  const PostImage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: Image.network(
        'https://picsum.photos/500/300?random=${post.id}',
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}