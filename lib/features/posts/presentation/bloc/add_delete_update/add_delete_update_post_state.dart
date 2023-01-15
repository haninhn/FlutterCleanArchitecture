part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  @override
  List<Object> get props => [];
}

class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

class LoadingState extends AddDeleteUpdatePostState {}

class LoadedState extends AddDeleteUpdatePostState {}

class ErrorState extends AddDeleteUpdatePostState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
class MessageAddDeleteUpdatePostState extends AddDeleteUpdatePostState {  //sucsse msg
  final String message;
  const MessageAddDeleteUpdatePostState({required this.message});
  @override
  List<Object> get props => [message];
}
