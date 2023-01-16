import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/core/app_theme.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async { 
final SharedPreferences sharedPreferences =  await SharedPreferences.getInstance(); 
  runApp(MyApp(sharedPreferences: sharedPreferences,));
}   

class MyApp extends StatelessWidget {
final SharedPreferences sharedPreferences;
  const MyApp({super.key, required this.sharedPreferences});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [], child:  MaterialApp(
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

