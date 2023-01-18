import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/core/app_theme.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'injection_container.dart' as di;

Future<void> main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
    runApp(const MyApp());
}   

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [ 
          BlocProvider(
              create: (_) => di.sl<PostsBloc>()),

    ], child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme ,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: const Center(child: Text('Hello world')
        ),
        ),
    )
    );

  }
}

