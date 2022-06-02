import 'dart:js';

import 'package:flutter/material.dart';
import 'package:movie/pages/home_page.dart';
import 'package:movie/pages/movie_dts.dart';
import 'package:movie/pages/new_movie_page.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MovieProvider(),
      child: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (context) => HomePage(),
        NewMoviePage.routeName : (context) => NewMoviePage(),
        MovieDetailsPage.routeName : (context) => MovieDetailsPage(),
      },
    );
  }
}
