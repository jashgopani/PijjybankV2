import 'package:flutter/material.dart';
import 'package:pijjybank/models/transaction.dart';
import 'package:pijjybank/widgets/budgetOverview.dart';

class Activity extends StatelessWidget {
  _showActivity(BuildContext context) {
    transactions.sort((a, b) {
      return b.date.compareTo(a.date);
    });
    DateTime current = DateTime.utc(2000, 1, 1);
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      child: ListView(
          children: transactions.map((t) {
            if (t.date.difference(current).inDays != 0) {
              print("Header ${t.date.toString()}");
              current = t.date;
              String headerText = "";
              if (t.date.difference(DateTime.now()).inDays == 0) {
                headerText = "Today";
              } else if (t.date.difference(DateTime.now()).inDays == 0) {
                headerText = "Yesterday";
              } else {
                headerText = t.date.toString();
              }
              return Column(
                children: <Widget>[
                  Container(
                    child: Text(headerText),
                    color: Colors.limeAccent,
                  ),
                  ListTile(
                    title: Text(t.title),
                    subtitle: Text(t.party),
                    leading:Icon(Icons.fastfood,color: Colors.red,),
                    trailing: Text(t.amount.toString()),

                  )
                ],
              );
            } else {
              return ListTile(
                title: Text(t.title),
                subtitle: Text(t.party),
                leading:Icon(Icons.fastfood,color: Colors.red,),
                trailing: Text(t.amount.toString()),
              );
            }
          }).toList(),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>(); //for drawer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Timeline*"),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          BudgetOverview(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Recent Activity",
                          style: TextStyle(
//                              color: Colors.white,
                            fontWeight: FontWeight.bold,
//                              fontSize: 20.0
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.filter_list),
//                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          )),
                      child: _showActivity(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add
        ),
        onPressed: (){
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("FAB"),
          ));
        },
      ),
    );
  }
}

//
//transactions.sort((a,b){
//return b.date.compareTo(a.date);
//});
//DateTime current = DateTime.utc(2000,1,1);
//return Scaffold(
//body: ListView(
//children: transactions.map((t) {
//if (t.date.difference(current).inDays != 0) {
//print("Header ${t.date.toString()}");
//current = t.date;
//String headerText = "";
//if(t.date.difference(DateTime.now()).inDays==0){
//headerText = "Today";
//}else if(t.date.difference(DateTime.now()).inDays==0){
//headerText = "Yesterday";
//}else{
//headerText = t.date.toString();
//}
//return Column(
//children: <Widget>[
//Container(child: Text(headerText),
//color: Colors.limeAccent,),
//ListTile(
//title: Text(t.title),
//subtitle: Text(t.party),
//leading: t.type
//? Icon(Icons.keyboard_arrow_down)
//    : Icon(Icons.keyboard_arrow_up),
//trailing: Text(t.amount.toString()),
//),
//],
//);
//} else {
//return ListTile(
//title: Text(t.title),
//subtitle: Text(t.party),
//leading: t.type
//? Icon(Icons.keyboard_arrow_down)
//    : Icon(Icons.keyboard_arrow_up),
//trailing: Text(t.amount.toString()),
//);
//}
//}).toList(),
//),);
