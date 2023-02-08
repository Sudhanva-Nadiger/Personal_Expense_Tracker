import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
      body: Column(
        children: const <Widget>[
          Card(
            color: Colors.blue,
            elevation: 5,
            child: SizedBox(
              width: double.infinity,
              child: Text("CHART!"),
            ),
          ),
          Card(
            child: Text("List of Expenses"),
          )
        ],
      ),
    );
  }
}
