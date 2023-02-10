import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No transactions yet!',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) => Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '\$${transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat().format(transactions[index].date),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
