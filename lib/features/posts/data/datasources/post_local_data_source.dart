import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_demo/core/error/exceptions.dart';
import 'package:flutter_demo/features/posts/data/models/post_model.dart';
import 'package:flutter_demo/features/posts/domain/entities/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDateSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}

class PostLocalDateSourceImpl implements PostLocalDateSource {
  final SharedPreferences sharedPreferences;

  PostLocalDateSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    //we wanna transfer the list of post model to list  map for enrigester list in device
    // list ofpostModels To map or json
    List postModelsToJson = postModels
        .map<Map<String, dynamic>>(
            (postModel) => postModel.toJson()) //map return type is MAP
        .toList(); //RETURN LIST OF MAP
    //save in shared pref
    sharedPreferences.setString("CACHED_POSTS", json.encode(postModelsToJson));
    //json encode Converts object to a JSON string
    return Future.value(unit);
  }

//maper
  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonStringList =
        sharedPreferences.getString("CACHED_POSTS"); //jbna il cash bil key
    if (jsonStringList != null) {
      List decodejsonData = json.decode(
          jsonStringList); // The jsonStringList parameter is a string representation of a JSON array,
      //json.decoder() method is used to parse a JSON string and convert it
      //into a list of objects
      //The decoder method converts this string into a List object
      List<PostModel> jsonToPostModels = decodejsonData
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      //list of map to list of postmodel
      // .map() is a method that can be called on an Iterable object,
      //such as a List, to transform each element in the iterable according to a given function. The function passed to.map() takes one element from the iterable as its argument and returns a new value. The resulting iterable will contain the new values produced by the function.
      //EXMPLE List .map() is returning a new List with new elements.

      //List<int> originalList = [1, 2, 3, 4, 5];
      //List<int> squaredList = originalList.map((i) => i * i).toList();
      return Future.value(jsonToPostModels);
    } else {}
      throw EmptyCacheException();
  }
}
