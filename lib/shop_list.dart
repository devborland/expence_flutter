import 'models/transaction.dart';

final DateTime date = DateTime.now();

final List<Transaction> shopList = [
  Transaction(
    amount: 10.0,
    date: DateTime.utc(date.year, date.month, date.day - 6),
    id: DateTime.now().toString(),
    title: 'Sneakers',
  ),
  Transaction(
    amount: 8.0,
    date: DateTime.utc(date.year, date.month, date.day - 5),
    id: DateTime.now().toString(),
    title: 'Mars',
  ),
  Transaction(
    amount: 12.0,
    date: DateTime.utc(date.year, date.month, date.day - 4),
    id: DateTime.now().toString(),
    title: 'Bounty',
  ),
  Transaction(
    amount: 10.0,
    date: DateTime.utc(date.year, date.month, date.day - 3),
    id: DateTime.now().toString(),
    title: 'Twix',
  ),
  Transaction(
    amount: 10.0,
    date: DateTime.utc(date.year, date.month, date.day - 2),
    id: DateTime.now().toString(),
    title: 'Picnik',
  ),
  Transaction(
    amount: 2.0,
    date: DateTime.utc(date.year, date.month, date.day - 1),
    id: DateTime.now().toString(),
    title: 'Шок',
  ),
  Transaction(
    amount: 2.0,
    date: DateTime.utc(date.year, date.month, date.day - 2),
    id: DateTime.now().toString(),
    title: 'Rafaello',
  ),
  Transaction(
    amount: 3.0,
    date: DateTime.utc(date.year, date.month, date.day - 3),
    id: DateTime.now().toString(),
    title: 'Nuts',
  ),
  Transaction(
    amount: 3.0,
    date: DateTime.utc(date.year, date.month, date.day - 4),
    id: DateTime.now().toString(),
    title: 'Topic',
  ),
];
