import 'package:dartz/dartz.dart';
import 'package:flutter_demo/features/posts/domain/entities/post.dart';
import 'package:flutter_demo/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/error/failures.dart';

class GetAllPostsUsecase{
  final Postsrepository repository;
  GetAllPostsUsecase(this.repository);

  Future<Either<Failure, List<Post>>> call() async{
    return await repository.getAllPosts();
  }

  
  }