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
          'https://cdn-icons-png.flaticon.com/512/25/25231.png',
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