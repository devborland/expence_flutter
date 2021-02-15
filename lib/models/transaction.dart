import 'package:meta/meta.dart';
import 'color_generator.dart';
import 'package:flutter/material.dart' show Color;

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Color color = ColorGenerator.getColor();

  Transaction({
    @required this.amount,
    @required this.date,
    @required this.id,
    @required this.title,
  });
}
