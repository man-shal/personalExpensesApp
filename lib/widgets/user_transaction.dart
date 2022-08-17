import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  //const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTxns = [
    Transaction(
      id: "848920",
      title: "bill",
      amount: 59.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: "010741",
      title: "maje",
      amount: 69.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: "431649",
      title: "petrol",
      amount: 79.00,
      date: DateTime.now(),
    ),
  ];

  void _addTxn(String txTitle, double txAmount) {
    setState(() {
      _userTxns.add(
        Transaction(
          title: txTitle,
          amount: txAmount,
          id: DateTime.now().toString(),
          date: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTxn),
        TransactionList(_userTxns),
      ],
    );
  }
}
