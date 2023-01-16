import 'package:flutter_demo/core/network/ntwork_info.dart';
import 'package:flutter_demo/features/posts/domain/usecases/add_post.dart';
import 'package:flutter_demo/features/posts/domain/usecases/delete_post.dart';
import 'package:flutter_demo/features/posts/domain/usecases/get_all_posts.dart';
import 'package:flutter_demo/features/posts/domain/usecases/update_post.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
final sl = GetIt.instance;  //OPJECT FROM GETiT LIBERY

Future<void> init() async {
//The () => is a anonymous function that calls the constructor of the class and return the instance.

//! Features - posts

// Bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(addPost: sl(), updatePost: sl(), deletePost: sl()));

//"registerFactory" method ensures that a new instance of the class is created every time it is accessed.
  
// Usecases
//Singleton IS MAKE AN instanse THAT buile one time
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));   
  // singleton instance of the "GetAllPostsUsecase" class
  // using the "registerLazySingleton" method from a dependency injection (DI) library, 
  //such as "sl" in this case
  //ensures that a single instance of the class is created, 
  //and it will only be created when it is first accessed

  // Repository
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl( remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
 //<PostsRepository> is a type parameter to specify the type of the instance that is going to be registered.

 // Datasources
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(() => PostLocalDataSourceImpl(sharedPreferences: sl()));
//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}