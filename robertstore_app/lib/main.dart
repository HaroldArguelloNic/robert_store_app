import 'package:flutter/material.dart';
import 'package:robertstore_app/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robert Store App',
      home: HomeScreen(),
    );
  }
}
