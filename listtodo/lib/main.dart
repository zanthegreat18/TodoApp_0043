import 'package:flutter/material.dart';
import 'package:listtodo/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Activity 2',
      theme: ThemeData(
        colorScheme: ColorScheme.light(brightness: Brightness.light),
      ),
      home: const FormPage(),
    );
  }
}