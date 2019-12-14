import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pijjybank/models/transaction.dart';
import 'package:pijjybank/screens/timeline.dart';
import 'package:pijjybank/widgets/transactionList.dart';

class Group {
  String name;
  String _created;
  double balance;
  String gid;
  FirebaseUser admin;
  FirebaseUser members;
  Transaction transactions;

  Group(this.name) {
    _created = DateTime.now().toString();
    var bytes = utf8.encode(_created + name);
    var hash = sha1.convert(bytes).toString();
    gid = hash.hashCode.toString();
    debugPrint("$name | $_created");
    print(bytes);
    print("digest = $gid");
    debugPrint("_________________________________________________");
  }
}

List<Group> groups = [
  Group("Jash"),
  Group("Group"),
  Group("Timeline"),
  Group("Pijjybank"),
  Group("Flutter"),
  Group("Transactions"),
];

listGroups() {
  return ListView.builder(
    itemCount: groups.length,
    itemBuilder: (BuildContext context, int index) {
      //if (index < 50)
      return ListTile(
        subtitle: Text(
          'Admin $index',
          style: transactionTitle,
        ),
        title: Text(
          groups[index].name,
        ),
        trailing: Text(
          "\u20B96900",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.purple
          ),
        ),
      );
    },
  );
}

var groupsAppBar = AppBar(
  backgroundColor: Colors.black,
  automaticallyImplyLeading: false,
  actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.group_add,
        color: Colors.white,
      ),
      onPressed: () {
        addGroup();
      },
      tooltip: "Add Group",
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

addGroup(){
  groups.add(Group("New"));
}
