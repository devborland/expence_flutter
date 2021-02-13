import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(
    this.label,
    this.spendingAmount,
    this.spendingPctOfTotal,
  );
  @override
  Widget build(BuildContext context) {
    print('build() ChartBar');
    return LayoutBuilder(builder: (ctx, constrains) {
      return Column(
        children: [
          Container(
            height: constrains.maxHeight * 0.12,
            child: FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(height: constrains.maxHeight * 0.05),
          Container(
            height: constrains.maxHeight * 0.6,
            width: 15,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
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
          SizedBox(height: constrains.maxHeight * 0.05),
          Container(
            height: constrains.maxHeight * 0.12,
            child: FittedBox(
              child: Text(
                label,
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ),
          ),
        ],
      );
    });
  }
}
