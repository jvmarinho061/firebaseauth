import 'package:flutter/material.dart';
import 'package:loginflutterteste/features/pages/details_page.dart';
import 'package:loginflutterteste/models/postModel.dart';

class PostHeader extends StatelessWidget {
  final PostModel post;

  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://media.licdn.com/dms/image/v2/D4D0BAQF7zOBiTXjQQA/company-logo_200_200/company-logo_200_200/0/1704316274180/esig_group_logo?e=2147483647&v=beta&t=3VRnvPvMV8E7drh4Ng0lo8pGc9G028E_mPOXVFfocbQ',
        ),
      ),
      title: Text('Usuário ${post.userId}'),
      subtitle: const Text('há 5 minutos'),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsPage(postId: post.id),
            ),
          );
        },
      ),
    );
  }
}