import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pijjybank/models/group.dart';
import 'package:pijjybank/widgets/transactionList.dart';

class Timeline extends StatefulWidget {
  final FirebaseUser user;

  Timeline({@required this.user});

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  var appbars = [
    timelineAppBar,
    groupsAppBar,
    groupsAppBar,
    groupsAppBar,
    groupsAppBar

  ];
  var screens = [
    transactionList(),
    listGroups(),
    Container(
        padding: EdgeInsets.all(100.0),
        color: Colors.green,
        child: Text("add new transaction")),
    Container(
        padding: EdgeInsets.all(100.0),
        color: Colors.green,
        child: Text("dashboard")),
    Container(
        padding: EdgeInsets.all(100.0),
        color: Colors.green,
        child: Text("more")),
  ];
  int currentScreen = 0;

  var selectedIconTheme = IconThemeData(color: Colors.white);
  var unselectedIconTheme = IconThemeData(color: Colors.white60);

  Widget _showScreen() {
    return screens[currentScreen];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbars[currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedIconTheme: unselectedIconTheme,
        selectedIconTheme: selectedIconTheme,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedItemColor: Colors.white60,
        currentIndex: currentScreen,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timeline,
            ),
            title: Text("Timeline"),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
              ),
              title: Text("Groups")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
              ),
              activeIcon: Icon(Icons.add_circle),
              title: Text("Add")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              title: Text("Dashboard")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              title: Text("More")),
        ],
        onTap: (int item) {
          setState(() {
            currentScreen = item;
          });
        },
      ),
      extendBody: true,
      body: _showScreen(),
    );
  }

  Widget _multiStats() {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SingleStat(
            title: "Expense",
            amount: 1300,
          ),
          Container(
            width: 0.5,
            height: 32.0,
            color: Colors.grey,
          ),
          SingleStat(
            title: "Income",
            amount: 300,
          )
        ],
      ),
    );
  }
}

class SingleStat extends StatelessWidget {
  String title;
  double amount;
  Color titleColor = Colors.grey;
  Color amountColor = Colors.black;

  SingleStat(
      {@required this.title,
      @required this.amount,
      this.titleColor,
      this.amountColor});

  @override
  Widget build(BuildContext context) {
    var titleStyle = TextStyle(
      fontSize: 16.0,
      color: titleColor,
    );

    var amountStyle = TextStyle(fontSize: 24.0, color: amountColor);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: titleStyle,
        ),
        Text(
          "\u20B9" + amount.toString(),
          style: amountStyle,
        )
      ],
    );
  }
}

var timelineAppBar = AppBar(
  backgroundColor: Colors.black,
  leading: IconButton(
    icon: Icon(
      Icons.filter_list,
      color: Colors.white,
    ),
    onPressed: () {},
    tooltip: "Filter List",
  ),
  actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.white,
      ),
      onPressed: () {},
      tooltip: "Search Transaction",
    ),
  ],
  centerTitle: true,
  title: SingleStat(
    title: "Balance",
    amount: 5000,
    titleColor: Colors.white,
    amountColor: Colors.white,
  ),
);
