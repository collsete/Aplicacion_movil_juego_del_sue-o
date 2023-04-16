import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<NotesPage> {
  List<Item> _items = [    Item('Objeto 1', 10.0, Colors.blue),    
  Item('Objeto 2', 20.0,Color.fromARGB(255, 102, 25, 128)),    
  Item('Objeto 3', 30.0, Colors.red),  ];

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
              title: Text(item.name),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Lógica de compra aquí
                },
                style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.green,
                ),
                child: Text('Comprar'),
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