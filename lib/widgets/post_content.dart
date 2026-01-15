import 'package:flutter/material.dart';
import 'package:loginflutterteste/models/postModel.dart';

class PostContent extends StatelessWidget {
  final PostModel post;
  const PostContent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title,
            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
            ),
            const SizedBox(height: 8),
          ],
        ),
    );
  }
}