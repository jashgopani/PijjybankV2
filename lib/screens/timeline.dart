import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'budgetOverview.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  final GlobalKey<ScaffoldState> _scaffoldDrawerKey =
      GlobalKey<ScaffoldState>(); //for drawer
  String _username = "Jash";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldDrawerKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              title: Text(
                "Timeline",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    debugPrint("Search Icon CLicked");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    debugPrint("Account Icon CLicked");
                  },
                ),
              ],
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  debugPrint("Drawer open");
                  _scaffoldDrawerKey.currentState.openDrawer();
                },
              ),
              expandedHeight: 200.0,
              backgroundColor: Colors.blue,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 80.0, bottom: 20.0),
                    child: BudgetOverview()),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(title: Text('Item #$index')),
                    // Builds 1000 ListTiles
                    childCount: 1000))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Hi " + _username,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Family"),
            ),
            ListTile(
              leading: Icon(Icons.timeline),
              title: Text("Timeline"),
            ),
            ListTile(
              leading: Icon(Icons.insert_chart),
              title: Text("Statistics"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
            ),
          ],
        )),
      ),
    );
  }
}

//temp

//),
