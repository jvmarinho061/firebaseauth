import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginflutterteste/features/posts/post_bloc.dart';
import 'package:loginflutterteste/features/posts/post_events.dart';
import 'package:loginflutterteste/features/posts/post_states.dart';
import 'package:loginflutterteste/widgets/post_card.dart';

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
    context.read<PostBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feed')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFBB8ED0), 
              Color(0xFFF29AAE)],
          ),
        ),
        child: BlocBuilder<PostBloc, PostState>
        (builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator(),
          );
          }
          if (state is PostError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error :  ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(child: const Text('Tentar novamente'),onPressed: () {
                    context.read<PostBloc>().add(FetchPosts());
                  }),
                ],
              ),
            );
          }
          if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return PostCard(post: post);
              },
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
