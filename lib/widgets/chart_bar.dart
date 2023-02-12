import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  //Se genera el construcctor del chartBar
  final String label;
  final double speendingAmount;
  final double spendingAmountTotal;

  const ChartBar(
    this.label,
    this.speendingAmount,
    this.spendingAmountTotal, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('\$${speendingAmount.toStringAsFixed(0)} ')),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 100,
          width: 20,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingAmountTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(label),
      ],
    );
  }
}
