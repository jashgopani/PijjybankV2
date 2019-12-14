import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pijjybank/models/transaction.dart';

var transactionTitle = TextStyle(
    fontWeight: FontWeight.bold, decorationStyle: TextDecorationStyle.solid);

transactionAmount(int index) {
  return TextStyle(
      fontSize: 16.0,
      color: getColor(index, 200), //green
      fontWeight: FontWeight.bold);
}

getColor(int index, int opacity) {
  //4CAF50,#4CAF50
  return transactions[index].isExpense
      ? Color.fromARGB(opacity, 244, 67, 54) //redD
      : Color.fromARGB(opacity, 76, 175, 80); //green
}

Widget transactionList() {
  return ListView.separated(
      separatorBuilder: (context, index) {
        if (index < transactions.length - 1) {
          if (transactions[index]
                  .date
                  .difference(transactions[index + 1].date)
                  .inDays >
              0) {
            return _printDate(index + 1);
          } else {
            return Container();
          }
        }
        return Container();
      },
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: <Widget>[_printDate(index + 1), transactionTile(index)],
          );
        }
        return transactionTile(index);
      });
}

transactionTile(int index) {
  return ListTile(
    onTap: (){},
    onLongPress: (){},
    leading: _itemIcon(index),
    title: Text(
      transactions[index].title,
      style: transactionTitle,
    ),
    subtitle: Text(transactions[index].party),
    trailing: Text(
      "\u20B9" + transactions[index].amount.toString(),
      style: transactionAmount(index),
    ),
  );
}

_printDate(int index) {
  String date;
  if (transactions[index].date.difference(DateTime.now()).inDays == 0){
    date = "Today";
  }else if(transactions[index].date.difference(DateTime.now()).inDays == 1){
    date = "Yesterday";
  }else{
    date = DateFormat("dd MMM").format(transactions[index].date) ;
  }
    return Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue[50]),
            child: Text(date)));
}

_itemIcon(int index) {
  return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0),
          color: getColor(index, 50) //green
          ),
      child: transactions[index].isExpense
          ? Icon(transactions[index].category.categoryIcon,
              color: getColor(index, 255))
          : Icon(transactions[index].category.categoryIcon,
              color: getColor(index, 255)));
}
