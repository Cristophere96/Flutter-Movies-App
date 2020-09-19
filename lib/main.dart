import 'package:flutter/material.dart';

import 'package:movies/src/screens/home/homeScreen.dart';
import 'package:movies/src/screens/movieDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        'detail': (context) => MovieDetail(),
      },
    );
  }
}
