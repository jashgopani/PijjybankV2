import 'package:flutter/material.dart';
import 'package:pijjybank/models/transaction.dart';
import 'package:side_header_list_view/side_header_list_view.dart';

class Activity extends StatelessWidget {
  _getDay(int weekday) {
    if (weekday == 1)
      return "MON";
    else if (weekday == 2)
      return "TUE";
    else if (weekday == 3)
      return "WED";
    else if (weekday == 4)
      return "THU";
    else if (weekday == 5)
      return "FRI";
    else if (weekday == 6)
      return "SAT";
    else
      return "SUN";
  }

  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); //for drawer

  @override
  Widget build(BuildContext context) {
    transactions.sort((a,b){
      return b.date.compareTo(a.date);
    });
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Timeline*",),
        elevation: 1.0,
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
      body: SideHeaderListView(
        padding: new EdgeInsets.all(8.0),
        itemCount: transactions.length,
        itemExtend: 70.0,
        headerBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(),
              child: Column(
                children: <Widget>[
                  Text(_getDay(transactions[index].date.weekday)),
                  Text(transactions[index].date.day.toString(),style: Theme.of(context).textTheme.headline,),
                ],
              ));
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 8.0,left: 8.0),
            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight:Radius.circular(8.0),bottomRight: Radius.circular(8.0),bottomLeft: Radius.circular(8.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transactions[index].title,style: Theme.of(context).textTheme.title,),
                    Text(transactions[index].party,style: Theme.of(context).textTheme.subtitle,)
                  ],
                ),
                Text(transactions[index].amount.toString(),style: Theme.of(context).textTheme.headline,)
              ],
            ),
          );
        },
        hasSameHeader: (int a, int b) {
          Duration val = transactions[a].date.difference(transactions[b].date);
          if (val.inDays == 0) return true;
          return false;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _scaffoldKey.currentState.showBottomSheet((context)=>_buildBottomSheet(context));
        },
      ),
    );
  }

  Container _buildBottomSheet(context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.7,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0),topRight: Radius.circular(16.0))
      ),
      child: Text("Bottom Sheet"),
    );
  }
}

//

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
