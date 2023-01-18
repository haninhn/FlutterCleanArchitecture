import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;
  const Post(
      {required this.id,
      required this.title,
      required this.body}); //constructor

  @override
  List<Object?> get props =>
      [id, title, body];
  //Equatable will call this probs
  //Equatable is designed to only work with
  //immutable objects so all member variables must be final.
  //Props property decides which objects we should consider for object comparison
  //Props is a getter method that will return List<Object>
}
// immutable object is an object whose state cannot be modified 
//after it is created.
// In other words, once an immutable object is created, 
//its properties or fields cannot be changed.
// This is in contrast to a mutable object, which can be modified after it is created. 
//Examples of immutable objects in programming languages include strings and numbers.