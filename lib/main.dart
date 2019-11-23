import 'package:flutter/material.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        statusBarColor: Colors.blue,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pijjybank",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Login(),
    );
  }
}

