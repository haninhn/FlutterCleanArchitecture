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
