import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginflutterteste/features/posts/post_bloc.dart';
import 'package:loginflutterteste/features/posts/post_events.dart';
import 'package:loginflutterteste/features/posts/post_states.dart';
import 'package:loginflutterteste/widgets/post_card.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override  
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPosts());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feed')),
      backgroundColor: Color(0xFFBB8ED0),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFBB8ED0), 
              Color(0xFFF29AAE)
              ],
          ),
        ),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {

            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PostError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Erro: ${state.message}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PostBloc>().add(FetchPosts());
                      },
                      child: const Text('Tentar novamente'),
                    ),
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
          },
        ),
      ),
    );
  }
}