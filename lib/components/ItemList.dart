import 'package:flutter/material.dart';
import 'package:mobilenwt/main.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.items});

  final List<NwtItem> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(items[index].name),
              subtitle: Text('£${items[index].value}'));
        },
      ),
    );
  }
}
