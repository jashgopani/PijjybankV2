import 'package:flutter/material.dart';
class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Timeline",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Timeline",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.account_circle),iconSize: 30.0,color: Colors.black,
            onPressed: (){
              debugPrint("Account Icon CLicked");
            },
            ),
          ],
          elevation: 0.0,
          leading: Icon(Icons.menu,color: Colors.black,),
          backgroundColor: Colors.white,
        ),

        body: Column(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal:15.0,vertical: 10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Row(children: <Widget>[
                  Text("\$5000",
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,),
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Container(
                    // margin: EdgeInsets.only(left:15.0,),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Row(children: <Widget>[
                      Text("\$400",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 30.0,
                      ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,),
                  ),
              Container(
                // margin: EdgeInsets.only(left:15.0,right: 15.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Row(children: <Widget>[
                  Text("\$300",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red
                  ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,),
              ),
                   
                 ],
               ) 
            ],
            )
          ],
        ),
      ),
    );
  }
}
