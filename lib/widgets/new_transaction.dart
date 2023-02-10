import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({super.key, required this.addNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredText = titleController.text;
    if (amountController.text == '') return;
    final enteredAmount = double.parse(amountController.text);

    if (enteredText.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTransaction(enteredText, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                'Add transaction',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
