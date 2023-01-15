part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

//first event
class GetAllPostsEvent extends PostsEvent{}

//2 event
class RefreshPostsEvent extends PostsEvent{}

