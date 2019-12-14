import 'package:flutter/material.dart';
import 'package:pijjybank/screens/timeline.dart';
import 'screens/login.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pijjybank",
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.blueAccent,
        canvasColor: Colors.white,
      ),
      home: Login(),
    );
  }
}

