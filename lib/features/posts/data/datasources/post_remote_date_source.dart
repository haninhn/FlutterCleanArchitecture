import 'package:dartz/dartz.dart';
import 'package:flutter_demo/features/posts/data/models/post_model.dart';

abstract class PostRemoteDateSource{
  Future<List<PostModel>> getAllPosts();
  Future<Unit> updatePost(PostModel post);
  Future<Unit> deletePost(int postId);
  Future<Unit> addPost(PostModel post);
}

class PostRemoteDateSourceImpl implements PostRemoteDateSource{
  @override
  Future<Unit> addPost(PostModel postModel) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int postId) {
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel post) {
    throw UnimplementedError();
  }


}