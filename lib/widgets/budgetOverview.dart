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
          StatisticBox(title:"Balance",amount:1000.0,textColor:Colors.black),
          StatisticBox(title:"Expense",amount:100.0,textColor:Colors.red),
          StatisticBox(title:"Income",amount:1000.0,textColor:Colors.green),
        ],
      ),
    );
  }
}


class StatisticBox extends StatelessWidget {

  final String title;
  final double amount;
  final Color textColor;

  final double _sqmargin = 2.0;
  final double _bRadius = 7.0;
  final double _fontSmall = 12.0;
  final double _fontLarge = 25.0;
  final double _containerHeight = 80.0;

//  StatisticBox(this.title, this.amount, this.textColor);

  StatisticBox({
    @required this.title,
    @required this.amount,
    @required this.textColor,
  });



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: _sqmargin),
        alignment: Alignment.center,
        height: _containerHeight,
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
              this.title,
              style: TextStyle(
                fontSize: _fontSmall,
              ),
            ),
            Text(
              //u20B9 is for rupee symbol
              "\u20B9"+this.amount.toString(),
              style: TextStyle(fontSize: _fontLarge, color: this.textColor),
            ),
          ],
        ),
      ),
    );
  }


}
