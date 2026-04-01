import 'package:flutter/material.dart';
import 'package:loginflutterteste/models/postModel.dart';
import 'package:loginflutterteste/widgets/widgetsPost/post_card_details.dart';
import 'package:loginflutterteste/widgets/widgetsPost/post_content.dart';
import 'package:loginflutterteste/widgets/widgetsPost/post_footer.dart';
import 'package:loginflutterteste/widgets/widgetsPost/post_header.dart';
import 'package:loginflutterteste/widgets/widgetsPost/post_image.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(post: post),
            PostContent(post: post),
            PostImage(post: post),
            PostCardDetails(post: post),
            PostFooter(post: post),
          ],
        ),
      ),
    );
  }
}