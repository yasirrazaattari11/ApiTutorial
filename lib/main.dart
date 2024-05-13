
import 'package:api_tutorials/example_four.dart';
import 'package:api_tutorials/example_three.dart';
import 'package:api_tutorials/example_two.dart';
import 'package:api_tutorials/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const ScreenFour()
    );
  }
}

