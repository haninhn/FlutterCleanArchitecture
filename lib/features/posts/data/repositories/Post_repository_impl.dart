import 'package:flutter_demo/core/error/exceptions.dart';
import 'package:flutter_demo/core/network/ntwork_info.dart';
import 'package:flutter_demo/features/posts/domain/entities/post.dart';

import 'package:flutter_demo/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/posts_repository.dart';
import '../datasources/Post_remote_date_source.dart';
import '../datasources/post_local_data_source.dart';
import '../models/post_model.dart';

class PostRepositoryImpl implements Postsrepository {
  final PostRemoteDateSource remoteDateSource;
  final PostLocalDateSource localDateSource;
  final NetworkInfo networkInfo;
  PostRepositoryImpl(
      {required this.remoteDateSource,
      required this.localDateSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModel postModel =
        PostModel(title: post.title, body: post.body, id: post.id);
    return await _getMessage(() {
      return remoteDateSource.addPost(postModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    return await _getMessage(() {
      return remoteDateSource.deletePost(id);
    });
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);
    return await _getMessage(() {
      return remoteDateSource.updatePost(postModel);
    });
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDateSource.getAllPosts();
        localDateSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDateSource.getCachedPosts();
        return Right(localPosts);
      } on ServerException { 
        return Left(EmptyCasheFailure());
      }
    }
  }

  //methode to handel errors
  Future<Either<Failure, Unit>> _getMessage(
      Future<Unit> Function() deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isConnected) {
      try {
        //function
        await deleteOrUpdateOrAddPost();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
