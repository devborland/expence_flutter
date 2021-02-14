import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.redAccent,
      Colors.black,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.green,
    ];
    _bgColor = availableColors[Random().nextInt(availableColors.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width < 400
            ? IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.teal,
                ),
                onPressed: () => widget.deleteTx(widget.transaction.id),
              )
            : TextButton(
                onPressed: () => widget.deleteTx(widget.transaction.id),
                child: Container(
                  width: 80.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Delete '),
                      const Icon(Icons.delete),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
