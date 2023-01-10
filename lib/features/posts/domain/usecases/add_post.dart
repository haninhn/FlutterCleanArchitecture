import 'package:dartz/dartz.dart';
import 'package:flutter_demo/features/posts/domain/entities/post.dart';

import '../../../../core/error/failures.dart';
import '../repositories/posts_repository.dart';

class AddPostUsecase {
  final Postsrepository repositories;

  AddPostUsecase(this.repositories);


  Future<Either<Failure, Unit>> call(Post post) async {
    return await repositories.addPost(post);
  }
}
