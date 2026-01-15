import 'package:flutter/material.dart';
import 'package:loginflutterteste/models/postModel.dart';
import 'package:loginflutterteste/widgets/post_card_details_body.dart';
import 'package:loginflutterteste/widgets/post_content.dart';
import 'package:loginflutterteste/widgets/post_header.dart';

class PostCardDetails extends StatelessWidget {
  final PostModel post;
  const PostCardDetails({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Header
        PostHeader(post: post),
        // Título do post       
        PostContent(post: post),
        //body apenas no details
        PostCardDetailsBody(post: post),
       // Rodapé, precisa ser diferente por questões de dimensões 
        const Divider(),
        const Row(
          children: [
            Icon(Icons.favorite_border, color: Colors.grey),
            SizedBox(width: 16),
            Icon(Icons.comment_outlined, color: Colors.grey),
            SizedBox(width: 16),
            Icon(Icons.share_outlined, color: Colors.grey),
          ],
        ),
      ],
    );
  }
}