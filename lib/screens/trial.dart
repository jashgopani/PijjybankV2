import 'package:flutter/material.dart';

class Trial extends StatefulWidget {
  @override
  _TrialState createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              title: Text(
                "Timezline",
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
              leading: Icon(
                Icons.menu,
              ),
              expandedHeight: 150.0,
              backgroundColor: Colors.blue,
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
                    (context, index) => ListTile(title: Text('Item #$index')),
                    // Builds 1000 ListTiles
                    childCount: 1000))
          ],
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
  double _sqmargin = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      //Budget Wala Section
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: _sqmargin),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black45,
                      offset: new Offset(0.0, 1.0),
                      blurRadius: 1.0)
                ],
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Balance",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    "\$5000",
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: _sqmargin),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black45,
                      offset: new Offset(0.0, 1.0),
                      blurRadius: 1.0)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Income",
                    style: TextStyle(
//                        color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "\$400",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: _sqmargin),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black45,
                      offset: new Offset(0.0, 1.0),
                      blurRadius: 1.0)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "\Expense",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "\$300",
                    style: TextStyle(fontSize: 25.0, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//temp

//),
