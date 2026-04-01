import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginflutterteste/features/posts/post_bloc.dart';
import 'package:loginflutterteste/features/posts/post_events.dart';
import 'package:loginflutterteste/features/posts/post_states.dart';
import 'package:loginflutterteste/widgets/widgetsPost/post_card_details.dart';

class DetailsPage extends StatefulWidget {
  final int postId;

  const DetailsPage({super.key, required this.postId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPostDetails(widget.postId));
  }

  @override
   Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      listener: (context, state) {
        if (state is PostLoaded) {
          final exists = state.posts.any((post) => post.id == widget.postId);
          if (!exists) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              // Fallback
              Navigator.pushReplacementNamed(context, '/posts');
            }
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes do Post'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PostDetailsLoaded) {
                return PostCardDetails(post: state.post);
              }
              if (state is PostError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
