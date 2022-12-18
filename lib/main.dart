import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mobilenwt/components/ItemList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Wealth tracker'),
    );
  }
}

class NwtItem {
  String name;
  num value;

  NwtItem(this.name, this.value);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textControllerName = TextEditingController();
  final _textControllerValue = TextEditingController();
  List<NwtItem> items = [];

  void _addItem() {
    setState(() {
      items.add(NwtItem(
          _textControllerName.text, int.parse(_textControllerValue.text)));
      _textControllerName.clear();
      _textControllerValue.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _textControllerName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a name',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _textControllerValue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a value',
                  ),
                ),
                ItemList(items: items)
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
