import 'package:flutter/material.dart';
import 'package:loginflutterteste/models/postModel.dart';

class PostFooter extends StatelessWidget {
  final PostModel post;

  const PostFooter({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${post.id * 12} curtidas'),
          Text('Ver todos os ${post.id * 2} comentários'),
          Text('Há ${post.id} minutos',
          style: const TextStyle(color: Colors.lightBlue, fontSize: 12),
          )
        ],
      ),
    );
  }
}