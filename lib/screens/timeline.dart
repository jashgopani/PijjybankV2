import 'package:flutter/material.dart';
import 'budgetOverview.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  final GlobalKey<ScaffoldState> _scaffoldDrawerKey = GlobalKey<ScaffoldState>();//for drawer

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldDrawerKey,
//        backgroundColor: Colors.blue,
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
                  iconSize: 30.0,
                  onPressed: () {
                    debugPrint("Search Icon CLicked");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.account_circle),
                  iconSize: 30.0,
                  onPressed: () {
                    debugPrint("Account Icon CLicked");
                  },
                ),
              ],
              leading: IconButton(
                icon:Icon(Icons.menu),
                onPressed: (){
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
                    margin: EdgeInsets.only(top: 80.0,bottom: 20.0),
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
          child: Column(
            children: <Widget>[
              Container(height: 50.0,color: Colors.purple,),
              Container(height: 50.0,color: Colors.red,),

              Container(height: 50.0,color: Colors.green,),

              Container(height: 50.0,color: Colors.yellow,),

              Container(height: 50.0,color: Colors.indigo,),

            ],
          ),
        ),
      ),
    );
  }
}



//temp

//),
