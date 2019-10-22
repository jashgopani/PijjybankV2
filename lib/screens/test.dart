import 'package:flutter/material.dart';
import 'package:pijjybank/models/transaction.dart';

class Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    transactions.sort((a,b){
      return b.date.compareTo(a.date);
    });
    DateTime current = DateTime.utc(2000,1,1);
    return Scaffold(
      body: ListView(
        children: transactions.map((t) {
          if (t.date.difference(current).inDays != 0) {
            print("Header ${t.date.toString()}");
            current = t.date;
            String headerText = "";
            if(t.date.difference(DateTime.now()).inDays==0){
              headerText = "Today";
            }else if(t.date.difference(DateTime.now()).inDays==0){
              headerText = "Yesterday";
            }else{
              headerText = t.date.toString();
            }
            return Column(
              children: <Widget>[
                Container(child: Text(headerText),
                color: Colors.limeAccent,),
                ListTile(
                  title: Text(t.title),
                  subtitle: Text(t.party),
                  leading: t.type
                      ? Icon(Icons.keyboard_arrow_down)
                      : Icon(Icons.keyboard_arrow_up),
                  trailing: Text(t.amount.toString()),
                ),
              ],
            );
          } else {
            return ListTile(
              title: Text(t.title),
              subtitle: Text(t.party),
              leading: t.type
                  ? Icon(Icons.keyboard_arrow_down)
                  : Icon(Icons.keyboard_arrow_up),
              trailing: Text(t.amount.toString()),
            );
          }
        }).toList(),
      ),
    );
  }
}
