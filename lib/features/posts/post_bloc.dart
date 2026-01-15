import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginflutterteste/features/posts/post_events.dart';
import 'package:loginflutterteste/features/posts/post_states.dart';
import 'package:loginflutterteste/features/repositories/post_repository.dart';
import 'package:loginflutterteste/models/postModel.dart';

class PostBloc extends Bloc<PostEvent, PostState>{
  final PostRepository repository;

  List<PostModel> _posts = [];

  PostBloc(this.repository) : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
    on<FetchPostDetails>(_onFetchPostsDeatils);
  }

  Future<void> _onFetchPosts(
    FetchPosts event,
    Emitter<PostState> emit,
  ) async {
    emit(PostLoading());

    try {
      _posts = await repository.getPosts();
      emit(PostLoaded(_posts));
    } catch (e) {
      emit (PostError(e.toString()));
    }
  }

  Future<void> _onFetchPostsDeatils(
    FetchPostDetails event, 
    Emitter<PostState> emit,
  ) async {
    emit(PostLoading());
  
  try {
    final post = await repository.getPostDetails(event.id);
    emit(PostDetailsLoaded(post));
  } catch (e) {
    emit(PostError(e.toString()));
  }
  }
}