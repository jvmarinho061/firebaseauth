import 'package:flutter/material.dart';
import 'package:loginflutterteste/models/postModel.dart';

class PostActions extends StatelessWidget {
  final PostModel post;

  const PostActions({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {
          }),
        ],
      ),
    );
  }
}