import 'package:flutter/material.dart';
import 'package:loginflutterteste/models/postModel.dart';

class PostCardDetailsBody extends StatelessWidget {
  final PostModel post;

  const PostCardDetailsBody({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.body,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}