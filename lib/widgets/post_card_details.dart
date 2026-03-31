import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginflutterteste/features/posts/post_bloc.dart';
import 'package:loginflutterteste/features/posts/post_events.dart';
import 'package:loginflutterteste/models/postModel.dart';


class PostCardDetails extends StatelessWidget {
  final PostModel post;
  const PostCardDetails({super.key, required this.post});

  void _toggleLIke(BuildContext context) {
    context.read<PostBloc>().add(ToggleLikePost(post));
  }

  void _showAddCommentDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context, 
      builder: (context) => 
      AlertDialog(
        title: const Text('Adicionar comentário'),
        content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Digite um comentário...'),
        maxLines: 3,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), 
          child: const Text('Cancelar'),
          ),
          ElevatedButton(onPressed: () {
            if (controller.text.trim().isNotEmpty) {
              context.read<PostBloc>().add(AddComment(post.id, controller.text.trim()));
              Navigator.pop(context);
            }
          }, 
          child: const Text('Enviar'),
          )
        ],
      ));
  }

  void _deletePost(BuildContext context) {
    // Opcional: confirmar exclusão
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir post'),
        content: const Text('Tem certeza que deseja excluir este post?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<PostBloc>().add(DeletePost(post.id));
              Navigator.pop(context);
              // Opcional: voltar para a lista após excluir
              Navigator.pop(context);
            },
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
          children: [
            GestureDetector(
              onTap: () => _toggleLIke(context),
              child: Icon(
                post.isLiked ? Icons.favorite : Icons.favorite_border,
                color: post.isLiked ? Colors.red : Colors.grey,
              ),
            ),
            SizedBox(width: 16),
            GestureDetector(
            onTap: () => _showAddCommentDialog(context),
            child: const Icon(Icons.comment_outlined, color: Colors.grey),
            ),
            SizedBox(width: 16),
            Icon(Icons.share_outlined, color: Colors.grey), //apenas demostracao do icone
            SizedBox(width: 16),
            GestureDetector(
            onTap: () => _deletePost(context),
            child: const Icon(Icons.delete_sweep_outlined, color: Colors.grey),
          ),
          ],
        ),
    );
  }
}