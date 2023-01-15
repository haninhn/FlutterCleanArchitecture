import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/features/posts/domain/entities/post.dart';
import 'package:flutter_demo/features/posts/domain/usecases/add_post.dart';
import 'package:flutter_demo/features/posts/domain/usecases/delete_post.dart';
import 'package:flutter_demo/features/posts/domain/usecases/update_post.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/message.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {   
      final UpdatePostUsecase updatePostsUseCase;
      final AddPostUsecase addPostUsecase;
      final DeletePostUsecase deletePostUsecase;


  AddDeleteUpdatePostBloc(param0, { required this.updatePostsUseCase, required this.addPostUsecase,required this.deletePostUsecase}) : super(AddDeleteUpdatePostInitial()) {
   
    on<AddDeleteUpdatePostEvent>((event, emit) async {
       if (event is UpdatePostEvent) {
          emit(LoadingState()); 
          final failureOrDoneMessage = await updatePostsUseCase(event.post);
          emit(_mapResponseToState(failureOrDoneMessage,ADD_SUCCESS_MESSAGE));
      }else if(event is DeletePostEvent){
          emit(LoadingState());
          final response = await deletePostUsecase.call(event.postId);
          emit(_mapResponseToState(response,DELETE_SUCCESS_MESSAGE));
      }else if(event is AddPostEvent){
                 emit(LoadingState()); 
       final response = await addPostUsecase.call(event.post);
       emit(_mapResponseToState(response, ADD_SUCCESS_MESSAGE));
      }

    });
  }
  
  AddDeleteUpdatePostState _mapResponseToState(Either<Failure, Unit> response, String successMessage) {
    //handel th respense od apî and return the state (if the cas is succes or faileur)
    return response.fold(
      (failure) => ErrorState(message: _mapFailureToMessage(failure)),
      (_) => MessageAddDeleteUpdatePostState(message: successMessage),
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
