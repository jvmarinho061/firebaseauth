abstract class PostEvent {}

class FetchPosts extends PostEvent {}

class FetchPostDetails extends PostEvent {
  final int id;
  FetchPostDetails(this.id);
}

