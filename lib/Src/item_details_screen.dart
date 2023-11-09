import 'package:flutter/material.dart';
import 'package:tesis/model/mision.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item item;

  const ItemDetailsScreen({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 100, 20, 124),
        title: Text(item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
             child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                item.imagePath,
                fit: BoxFit.cover,
              ),
),
            ),
            const SizedBox(height: 16),
            Text(
              '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}