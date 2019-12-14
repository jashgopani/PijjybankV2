import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'timeline.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseUser _user;

  bool busy = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then(
          (user) => setState(() => this._user = user),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                  onPressed: this.busy
                    ?null
                      :()async{
                    setState(() {
                      this.busy=true;
                    });
                    final user = await this._googleSignIn();
                    this.gotoTimeline(user);
                    setState(() {
                      this.busy=false;
                    });
                  }
                ),
              ],
            ),
          ),
        ));
  }

  Future<FirebaseUser> _googleSignIn()async {
    final curUser = this._user??await FirebaseAuth.instance.currentUser();
    if(curUser!=null && !curUser.isAnonymous){
      return curUser;
    }
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    var info = new UserUpdateInfo();
    info.displayName = "Jash";
    setState(() {
      user.updateProfile(info);
      this._user = user;
    });
    return user;
  }

  void gotoTimeline(user) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return Timeline();
        }));
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
