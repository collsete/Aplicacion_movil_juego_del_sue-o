import 'package:flutter/material.dart';

class consejosScreen extends StatelessWidget {
  final List<String> consejos = [
    'Aprende el lenguaje de programación Dart',
    'Utiliza el widget MaterialApp',
    'Usa widgets de forma eficiente',
    'Utiliza paquetes de terceros',
    'Utiliza los servicios de Firebase',
    'Realiza pruebas unitarias',
    'Optimiza el rendimiento de tu aplicación'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consejos en Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Consejos en Flutter'),
        ),
        body: ListView.builder(
          itemCount: consejos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.lightbulb_outline),
              title: Text(consejos[index]),
            );
          },
        ),
      ),
    );
  }
}