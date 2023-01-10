import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  //if we dant have connection
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  //if we have failer on server
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EmptyCasheFailure extends Failure {
  //if we have failer on emptyCash 
  @override
  List<Object?> get props => [];
}
class WrongDataFailure extends Failure { 
  //if we have failer on input wrong data
  @override
  List<Object?> get props => [];
}

