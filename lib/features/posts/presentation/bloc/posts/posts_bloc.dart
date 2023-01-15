import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/core/error/failures.dart';
import '../../../../../core/strings/failures.dart';

import '../../../domain/entities/post.dart';
import '../../../domain/usecases/get_all_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUsecase getAllPosts;
  
  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {  //function can contain one or more asynchronous operations
      // The on function is used to handle events of type PostsEven; the "on" method is from the bloc package and it is used to listen
      // for specific types of events. In this case, it is listening for events of type "PostsEvent"
      //and it takes in two arguments, "event" and "emit".
      if (event is GetAllPostsEvent || event is RefreshPostsEvent) {
        //When one of these events is received, the code emits a "LoadingPostState" event
        emit(LodingPostState()); // emits a "LoadingPostState" event
        final responseIsfailureOrposts = await getAllPosts
            .call(); //This use case can retune a faileur or list of posts  type
        emit(_mapFailureOrPostsToState(
            responseIsfailureOrposts)); //The "emit" function is used to dispatch events to the "Bloc" and update the state of the app 
      }
    });
  }
//The on method is used to listen to events of loading post and updating the state of the application,
// for example, when the user press a button, 
//the on method will be triggered and the async function will be executed and emit an event to update the state of the app.
  PostsState _mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    //handel the posts state of response
    return either.fold(
      (failure) => ErrorPostState(message: _mapFailureToMessage(failure)),
      (posts) => LoadedPostsState(posts: posts),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    //handel the errors
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case EmptyCasheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;

      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }
}
