import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                'No transancions added yet',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20.0),
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
              return TransactionItem(
                key: ValueKey(transactions[index].id),
                transaction: transactions[index],
                deleteTx: deleteTx,
              );
            },
          );
  }
}
