import 'dart:io';
import 'adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool isIos = Platform.isIOS;
// bool isIos = true;

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx) {
    print('Constructor NewTransaction widget');
  }

  @override
  _NewTransactionState createState() {
    print('createState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
  _NewTransactionState() {
    print('Constructor _NewTransactionState');
  }

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) return;
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null)
      return;

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 24),
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No date chosen'
                          : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  AdaptiveTextButton('Choose Date', _presentDatePicker),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
