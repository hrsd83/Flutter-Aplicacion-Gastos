import 'package:flutter/material.dart';
import 'package:flutter_expense_application/models/transaction.dart';
import 'package:intl/intl.dart';

//Se crea el StateFulWidget para crear cada transaction
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.grey.shade800, width: 1.5)),
                padding: EdgeInsets.all(10),
                child: Text(
                  //Interpolacion del monto
                  '\$${tx.amount} ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.shade900),
                ),
              ),
              Column(
                //Titulo
                //Se alinean los elementos a la izquierda
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    //Fecha
                    DateFormat('dd/MM/yyyy').format(tx.date),
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                  )
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
