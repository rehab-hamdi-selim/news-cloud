import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_cloud/manager/cubit.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => AppCubit()..getArticles(category: 'science'),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {'home_screen': (context) => HomeScreen()},
        title: 'News cloud',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
        home: SplashScreen(),
      ),
    );
  }
}

