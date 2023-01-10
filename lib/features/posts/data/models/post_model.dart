import 'package:flutter_demo/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel(
      {required super.id, required super.title, required super.body});

//constructor transfer fom json
  factory PostModel.fromJson(Map<String, dynamic> json) {
    //Map key Value //map collection
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }

//transfer to json
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }

  //Factory keyword is used when implementing constructors that do not create new instance of the existing class
  //a factory constructor can return value from cache or instance of a sub-type 
  //use if when creating only one instance of the class 
  //for returning sub-class instance of the class instead of the class itself
}
