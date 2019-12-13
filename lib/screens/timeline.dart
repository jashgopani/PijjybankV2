import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Timeline extends StatefulWidget {
  final FirebaseUser user;

  Timeline({@required this.user});

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  var tabs = ["Recent Transactions", "Expense Groups", "Account Summary"];
  var screens = [
    Container(padding: EdgeInsets.all(100.0),
        color: Colors.green,
        child: Text("timeline")),
    Container(padding: EdgeInsets.all(100.0),
        color: Colors.green,
        child: Text("groups")),
    Container(padding: EdgeInsets.all(100.0),
        color: Colors.green,
        child: Text("summary")),
  ];
  int currentScreen = 0;

  Widget _appbar() {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Your Balance",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Rs.6900",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 32.0),
              )
            ],
          ),
          CircleAvatar(
            radius: 24.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                'https://picsum.photos/250?image=9',
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _tabs() {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
            children: <Widget>[ ListView.builder(
              itemCount: tabs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int item) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 24.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentScreen = item;
                      });
                    },
                    child: Text(
                      tabs[item],
                      style: TextStyle(
                        color: item == currentScreen ? Colors.blue : Colors
                            .grey,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
            ]
        ),
      ),
    );
  }

  Widget _showScreen() {
    return Expanded(
      flex: 15,
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          setState(() {
            print("gesture");
            currentScreen = (currentScreen + 1) % tabs.length;
          });
        },
        child: screens[currentScreen],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Column(
        children: <Widget>[
          _appbar(),
          _tabs(),
          _showScreen()
        ],
      ),
    );
  }
}
