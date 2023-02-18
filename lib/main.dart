import 'package:flutter/material.dart';
import 'package:flutter_demo/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Land Info',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DashBoard(),
    );
  }
}
