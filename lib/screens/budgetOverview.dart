import 'package:flutter/material.dart';

class BudgetOverview extends StatefulWidget {
  @override
  _BudgetOverviewState createState() => _BudgetOverviewState();
}

class _BudgetOverviewState extends State<BudgetOverview> {
  double _sqmargin = 2.0;
  double _bRadius = 10.0;
  double _fontSmall = 12.0;
  double _fontLarge = 25.0;

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
                borderRadius: BorderRadius.circular(_bRadius),
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
                    style: TextStyle(fontSize: _fontSmall),
                  ),
                  Text(
                    "\$5000",
                    style: TextStyle(
                      fontSize: _fontLarge,
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
                borderRadius: BorderRadius.circular(_bRadius),
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
                      fontSize: _fontSmall,
                    ),
                  ),
                  Text(
                    "\$400",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: _fontLarge,
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
                borderRadius: BorderRadius.circular(_bRadius),
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
                      fontSize: _fontSmall,
                    ),
                  ),
                  Text(
                    "\$300",
                    style: TextStyle(fontSize: _fontLarge, color: Colors.red),
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