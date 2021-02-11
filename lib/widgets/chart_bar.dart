import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(
    this.label,
    this.spendingAmount,
    this.spendingPctOfTotal,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 12.0,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(height: 4.0),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.0,
                  ),
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                heightFactor: spendingPctOfTotal < 0 ? 0 : spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade500),
        ),
      ],
    );
  }
}
