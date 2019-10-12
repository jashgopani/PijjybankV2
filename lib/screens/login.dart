import 'package:flutter/material.dart';
import 'timeline.dart';
import 'trial.dart';
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 6.0,
                      )),
                  child: Text(
                    "Pb",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 90.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                RaisedButton(
                  elevation: 3.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GoogleIcon(),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "Sign in with Google",
                            style: TextStyle(fontSize: 20.0),
                          ))
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Trial();
                    }));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage ai = AssetImage("images/googleIcon.png");
    Image image = Image(
      height: 28.0,
      image: ai,
    );
    return image;
  }
}
