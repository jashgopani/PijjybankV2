import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pijjybank/screens/groups.dart';

import '../widgets/budgetOverview.dart';

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
        backgroundColor: Colors.white,
        key: _scaffoldDrawerKey,
        body: RefreshIndicator(
          onRefresh: () async {
            //as this always returns a future object, we have just added a future delay and
            // await keyword by default returns a future object so no need to return explicitly here
            await Future.delayed(Duration(seconds: 1));
            _scaffoldDrawerKey.currentState.showSnackBar(SnackBar(
              content: Text("Refreshed"),
            ));
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
//              floating: true,
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
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      debugPrint("Filter Icon CLicked");
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
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 80.0),
                      child: BudgetOverview()),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => Dismissible(
                            background: Container(
                              color: Colors.red,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            key: Key((this).toString() + index.toString()),
                            onDismissed: (DismissDirection d) {
                              print(d.toString());
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 0.5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                              ),
                              child: Card(
                                child: ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        shape: BoxShape.circle,
                                      ),
                                      margin: EdgeInsets.zero,
                                      padding: EdgeInsets.all(7.0),
                                      child: Icon(Icons.fastfood,
                                          size: 35.0, color: Colors.red)),
                                  title: Text(
                                    'Expense #$index',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17.0),
                                  ),
                                  subtitle: Text(
                                    'Some random description aksbjask ksfhk kafkjkf kfg aksgf kags fkg',
                                    overflow: TextOverflow.clip,
                                  ),
                                  trailing: Text(
                                    "\u20B9303",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.red,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  isThreeLine: true,
                                ),
                              ),
                            ),
                          ),
                      childCount: 50))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scaffoldDrawerKey.currentState.showSnackBar(new SnackBar(
              content: new Text("Added Transaction"),
              action: SnackBarAction(
                label: "Undo",
                onPressed: () {
                  debugPrint("Snackbar action clicked");
                },
              ),
            ));

//            _scaffoldDrawerKey.currentState.showBottomSheet((context) {
//              return Container(
//                height:100.0,
//                  child: Column(
//                children: <Widget>[
//                  Text("Bottom Sheet"),
//                ],
//              ));
//            },
//                elevation: 6.0,
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(20.0)));
          },
          child: Icon(Icons.add),
          tooltip: "Add new transaction",
        ),
        drawer: Drawer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              duration: const Duration(milliseconds: 30000),
              child: UserAccountsDrawerHeader(
                accountEmail: Text("jash@gmail.com",
                    style: TextStyle(
                      fontSize: 15.0,
                    )),
                accountName: Text(_username,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600)),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Group"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Groups();
                }));
              },
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
                leading: Icon(Icons.account_circle), title: Text("Profile")),
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
