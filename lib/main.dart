import 'package:flutter/material.dart';
import 'timeline.dart';


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
      title: "Pijjybank",
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Placeholder(
                color: Colors.green,
//                  fallbackWidth: 100.0,
                fallbackHeight: 150.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    debugPrint("pressed");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return new Timeline();
                        }));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_box,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        Text(
                          "Sign in with Google",
                          style:
                          TextStyle(color: Colors.white, fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

