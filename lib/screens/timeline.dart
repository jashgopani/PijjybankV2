import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Timeline",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Timeline",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () {
                debugPrint("Account Icon CLicked");
              },
            ),
          ],
          elevation: 0.0,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              BudgetOverview(),
            ],
          ),
        ),
      ),
    );
  }
}

class BudgetOverview extends StatefulWidget {
  @override
  _BudgetOverviewState createState() => _BudgetOverviewState();
}

class _BudgetOverviewState extends State<BudgetOverview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(//Budget Wala Section
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical:5.0,horizontal: 25.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Balance",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    Text(
                      "\$5000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical:5.0,horizontal: 25.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Income",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      "\$400",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical:5.0,horizontal: 25.0),
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    Text(
                      "\Expense",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    Text(
                      "\$300",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
