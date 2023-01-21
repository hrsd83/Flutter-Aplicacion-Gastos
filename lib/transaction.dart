import 'package:flutter/material.dart';

//Class para la transaccion
//Se le coloca la variable final
class Transaction {
  final String id;
  final String title;
  final int amount;
  final DateTime date;

  //constructor de la transaccion
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
