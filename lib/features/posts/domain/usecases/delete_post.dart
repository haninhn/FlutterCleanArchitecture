import 'package:dartz/dartz.dart';
import 'package:flutter_demo/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/error/failures.dart';

class DeletePostUsecase{
   final Postsrepository repositories; 
   DeletePostUsecase(this.repositories);
   Future<Either<Failure, Unit>> call(int postId) async{
     return await repositories.deletePost(postId);
  }

}
