import 'package:dartz/dartz.dart';
import 'package:flutter_demo/features/posts/data/models/post_model.dart';

abstract class PostLocalDateSource{
  Future<List<PostModel>> getCachedPosts();
  Future<List<Unit>> cachedPosts(List<PostModel> postModels);
}


class PostLocalDateSourceImpl implements PostLocalDateSource {
  @override
  Future<List<Unit>> cachedPosts(List<PostModel> postModels) {
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    throw UnimplementedError();
  }


}