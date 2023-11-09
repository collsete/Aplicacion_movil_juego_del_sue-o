import 'package:flutter/material.dart';

class Mission {
  final String name;
  final String description;
  final int cost;
  final Color borderColor;
  final bool isNameStriked; // Nueva propiedad

  Mission({
    required this.name,
    required this.description,
    required this.cost,
    required this.borderColor,
    this.isNameStriked = false, // Valor por defecto es falso
  });
}

class settings extends StatelessWidget {
  final List<Mission> missions = [
    Mission(name: 'Iniciar la sesión durante 7 días seguidos.', description: 'Descripción de la misión 1', cost: 5, borderColor: Colors.green[700]!,isNameStriked: true),
    Mission(name: 'Usar la aplicación un total de 14 días.', description: 'Descripción de la misión 2', cost: 7, borderColor: Colors.green[700]!, isNameStriked: true),
    Mission(name: 'Haz Crecer una planta.', description: 'Descripción de la misión 3', cost: 10, borderColor: Colors.green[700]!,isNameStriked: true),
    Mission(name: 'Obtener un total de 200 monedas doradas.', description: 'Descripción de la misión 4', cost: 15, borderColor: Colors.yellow[700]!),
    Mission(name: 'Gastar un total de 100 monedas.', description: 'Descripción de la misión 5', cost: 20, borderColor: Colors.yellow[700]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: missions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: missions[index].borderColor, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text(
                  missions[index].name,
                  style: TextStyle(
                    decoration: missions[index].isNameStriked ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text('${missions[index].cost} monedas'),
                onTap: () {
                  // Aquí puedes añadir la lógica para abrir la misión
                },
              ),
            ),
          );
        },
      ),
    );
  }
}