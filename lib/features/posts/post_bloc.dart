import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginflutterteste/features/posts/post_events.dart';
import 'package:loginflutterteste/features/posts/post_states.dart';
import 'package:loginflutterteste/features/repositories/post_repository.dart';
import 'package:loginflutterteste/models/postModel.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  List<PostModel> _posts = [];

  PostBloc(this.repository) : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
    on<FetchPostDetails>(_onFetchPostDetails);
    on<ToggleLikePost>(_onToggleLike);
    on<FetchComments>(_onFetchComments);
    on<AddComment>(_onAddComment);
    on<EditComment>(_onEditComment);
    on<DeleteComment>(_onDeleteComment);
    on<DeletePost>(_onDeletePost);
  }

   Future<void> _onFetchPosts(
    FetchPosts event,
    Emitter<PostState> emit,
  ) async {
    emit(PostLoading());
    try {
      _posts = await repository.getPosts();
      _posts = _posts.map((post) => post.copyWith(comments: [])).toList();
      emit(PostLoaded(List.from(_posts)));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  void _onFetchPostDetails(
    FetchPostDetails event,
    Emitter<PostState> emit,
  ) {
    final post = _posts.firstWhere(
      (p) => p.id == event.id,
      orElse: () => throw Exception('Post não encontrado'),
    );

    emit(PostDetailsLoaded(post));
  }

  void _onToggleLike(
    ToggleLikePost event,
    Emitter<PostState> emit,
  ) {
    _posts = _posts.map((post) {
      if (post.id == event.post) {
        return post.copyWith(isLiked: !post.isLiked);
      }
      return post;
    }).toList();

    emit(PostLoaded(List.from(_posts)));
  }

  void _onFetchComments(
    FetchComments event,
    Emitter<PostState> emit,
  ) async {
    emit(PostLoading());

    try {
      final post = _posts.firstWhere((p) => p.id == event.postId);
      final comments = await repository.getComments(event.postId);

      emit(CommentsLoaded(post, comments));
    } catch (e) {
      emit(PostError('Erro ao carregar comentários'));
    }
  }

  void _onAddComment(
    AddComment event,
    Emitter<PostState> emit,
  ) {
    _posts = _posts.map((post) {
      if (post.id == event.postId) {
        return post.copyWith(
          comments: [...post.comments, event.comment],
        );
      }
      return post;
    }).toList();
    emit(PostLoaded(List.from(_posts)));
  }

  void _onDeletePost(DeletePost event, Emitter<PostState> emit) {
  _posts = _posts.where((post) => post.id != event.postId).toList();
  emit(PostLoaded(List.from(_posts)));
}

  void _onEditComment(
    EditComment event,
    Emitter<PostState> emit,
  ) {
    _posts = _posts.map((post) {
      if (post.id == event.postId) {
        return post.copyWith(
          comments: post.comments.map((comment) {
            if (comment.id == event.commentId) {
              return comment.copyWith(content: event.newContent);
            }
            return comment;
          }).toList(),
        );
      }
      return post;
    }).toList();
    emit(PostLoaded(List.from(_posts)));
  }
 void _onDeleteComment(
    DeleteComment event,
    Emitter<PostState> emit,
  ) {
    _posts = _posts.map((post) {
      if (post.id == event.postId) {
        return post.copyWith(
          comments: post.comments.where((comment) => comment.id != event.commentId).toList(),
        );
      }
      return post;
    }).toList();
    emit(PostLoaded(List.from(_posts)));
  }
}

