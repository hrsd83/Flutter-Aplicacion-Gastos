import 'package:flutter/material.dart';
import 'package:flutter_expense_application/widgets/transaction_list.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 85.89,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Meal',
      amount: 28.56,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
