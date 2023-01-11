// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_demo/core/error/exceptions.dart';
import 'package:flutter_demo/features/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDateSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> updatePost(PostModel post);
  Future<Unit> deletePost(int postId);
  Future<Unit> addPost(PostModel post);
}

const baseurl = "https://jsonplaceholder.typicode.com/";

class PostRemoteDateSourceImpl implements PostRemoteDateSource {
  final http.Client client;

  PostRemoteDateSourceImpl({required this.client});


  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };
  final response = await client.post(Uri.parse(baseurl + "/posts/"), body: body);
  if(response.statusCode ==201){
    return Future.value(unit);
  }else
    {
      throw ServerException();
    }

  }

  @override
  Future<Unit> deletePost(int postId)async {
    final response = await client.delete(Uri.parse(baseurl + "/posts/${postId.toString()}"),
    headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
}

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(Uri.parse(baseurl + "/posts/"),
        headers: {"Content-Type": "application/json"});
       //The client.get() method returns a Future<Response> object, which represents the response that will be received from the server
        if(response.statusCode == 200){
          final List decodedJson = json.decode(response.body) as List;
          final List<PostModel> postModel = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
          return postModel;
        }else{
          throw ServerException();
        }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final postId = postModel.id.toString();
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    final response = await client.patch(Uri.parse(baseurl + "/posts/$postId"), body: body,);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
