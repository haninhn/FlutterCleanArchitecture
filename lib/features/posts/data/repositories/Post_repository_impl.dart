import 'package:flutter_demo/features/posts/domain/entities/post.dart';

import 'package:flutter_demo/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/posts_repository.dart';
import '../datasources/Post_remote_date_source.dart';
import '../datasources/post_local_data_source.dart';

class PostRepositoryImpl implements Postsrepository {
  final PostRemoteDateSource remoteDateSource;
  final PostLocalDateSource localDateSource;

  PostRepositoryImpl(this.remoteDateSource, this.localDateSource);

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    await remoteDateSource.addPost(post);
            throw UnimplementedError();

  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id)async {
        await remoteDateSource.deletePost(id);
                throw UnimplementedError();

  }

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async{
        await remoteDateSource.getAllPosts();
        throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
        await remoteDateSource.updatePost(post);
                throw UnimplementedError();

  }

}


