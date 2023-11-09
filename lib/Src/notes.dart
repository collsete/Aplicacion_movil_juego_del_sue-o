import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<NotesPage> {
  List<Item> _items = [
    Item('Sansevieria', 10.0, Colors.grey[600]!),
    Item('Margarita', 20.0, Colors.grey[600]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            color: item.color,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text: item.name,
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.grey[700],
                    decorationThickness: 2.0,
                  ),
                ),
              ),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Lógica de compra aquí
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[600]!,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Comprar',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey[600]!,
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String name;
  final double price;
  final Color color;

  Item(this.name, this.price, this.color);
}