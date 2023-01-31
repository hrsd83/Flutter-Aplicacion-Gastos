import 'package:flutter/material.dart';
import 'package:flutter_expense_application/models/transaction.dart';
import 'package:intl/intl.dart';

//Se crea el StateFulWidget para crear cada transaction
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // color: Colors.red,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 1.5)),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    //Interpolacion del monto
                    '\$${transactions[index].amount.toStringAsFixed(2)} ',
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
                      transactions[index].title,
                      style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      //Fecha
                      DateFormat('dd/MM/yyyy').format(transactions[index].date),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
