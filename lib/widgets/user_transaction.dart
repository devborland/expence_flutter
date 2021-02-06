import 'package:flutter/material.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      amount: 15.00,
      date: DateTime.now(),
      id: 't2',
      title: 'null',
    ),
    Transaction(
      amount: 15.00,
      date: DateTime.now(),
      id: 't2',
      title: 'null',
    ),
    Transaction(
      amount: 15.00,
      date: DateTime.now(),
      id: 't2',
      title: 'null',
    ),
    Transaction(
      amount: 15.00,
      date: DateTime.now(),
      id: 't2',
      title: 'null',
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: txTitle,
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
