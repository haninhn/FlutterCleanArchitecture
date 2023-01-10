//user should add post delete post consult posts update
import 'package:flutter_demo/features/posts/domain/entities/post.dart';

abstract class Postsrepository {
  //usecases
  Future<List<Post>> getAllPosts(); //getpost return a list
//Future ASYNC like suspend
//Dart/Flutter Future overview.
//A Future represents a potential value (success), or error (fail), that will be available in the future.
//porpos od async "the data in getAllPosts we cannot get immediately instead we have to wait for it and make network request"
//async await, 3 task asyncrone : async(1 print text -> 2 : await print api test-> 3 :print text
//result print 1 and print 2 after a litter time and then print 3
//if we dont put async await it will print 1 and 3 and then 2 when the data is came
  Future<bool> deletePost(int id);
  Future<bool> updatePost(Post post);
  Future<bool> addPost(Post post);

}
