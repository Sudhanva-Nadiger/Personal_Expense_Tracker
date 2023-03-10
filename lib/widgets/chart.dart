import "package:expense_tracker/models/transaction.dart";
import "package:expense_tracker/widgets/cart_bar.dart";
import 'package:intl/intl.dart';
import "package:flutter/material.dart";

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions, {super.key});

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).toString(),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactions.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: groupedTransactions.map(
            (data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    lable: data['day'].toString(),
                    spendingAmount: data['amount'] as double,
                    spendingTotal: totalSpending == 0.0
                        ? 0.0
                        : ((data['amount'] as double) / totalSpending)),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
