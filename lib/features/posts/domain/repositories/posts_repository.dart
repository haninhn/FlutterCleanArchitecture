//user should add post delete post consult posts update
import 'package:dartz/dartz.dart';
import 'package:flutter_demo/features/posts/domain/entities/post.dart';

import '../../../../core/error/failures.dart';

abstract class Postsrepository {   //abstract  class because class is with multipel use (mchtrak) between domain and data lyer
  //usecases
  Future<Either<Failure, List<Post>>> getAllPosts(); //getpost return a list
//Future ASYNC like suspend
//Dart/Flutter Future overview.
//A Future represents a potential value (success), or error (fail), that will be available in the future.
//porpos od async "the data in getAllPosts we cannot get immediately instead we have to wait for it and make network request"
//async await, 3 task asyncrone : async(1 print text -> 2 : await print api test-> 3 :print text
//result print 1 and print 2 after a litter time and then print 3
//if we dont put async await it will print 1 and 3 and then 2 when the data is came
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatePost(Post post);
  Future<Either<Failure, Unit>> addPost(Post post);

}

//now we wanna handel the result of api request Failer or succes [list of data]
//Either
//handel result type