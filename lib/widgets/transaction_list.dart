import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                'No transancions added yet',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20.0),
              Container(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.4,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width < 400
                      ? IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.teal,
                          ),
                          onPressed: () => deleteTx(transactions[index].id),
                        )
                      : TextButton(
                          onPressed: () => deleteTx(transactions[index].id),
                          child: Container(
                            width: 80.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Delete '),
                                Icon(Icons.delete),
                              ],
                            ),
                          ),
                        ),
                ),
              );
            },
          );
  }
}
