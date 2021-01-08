import 'package:flutter/material.dart';
import 'package:quizz_app/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
