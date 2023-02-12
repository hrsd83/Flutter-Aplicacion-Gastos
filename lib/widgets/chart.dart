import 'package:flutter/material.dart';
import 'package:flutter_expense_application/models/transaction.dart';
import 'package:flutter_expense_application/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  //Se hace una lista con las transacciones recientes
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);
  //Generamos una Lista  de tipo map y tendra valores mixto

  List<Map<String, dynamic>> get transactionValues {
    //List.generate, generara una lista de 7 dias
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      //Variable con la suma total
      var totalSum = 0.0;
      //se crea un bucle  para las transacciones del dia, mes y año

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          //Se le asigna a totalSum la suma de de las transacciones recientes del dia
          totalSum += recentTransactions[i].amount;
        }
      }

      //retornara una una lista Mapeada
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return transactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: transactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
