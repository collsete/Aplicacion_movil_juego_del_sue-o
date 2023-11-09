import 'package:flutter/material.dart';
import 'package:tesis/utils/user_preferences.dart';
import 'package:tesis/widgets/porfileWidger.dart';

class PorfilePage extends StatefulWidget {
  const PorfilePage({Key? key}) : super(key: key);

  @override
  State<PorfilePage> createState() => _PorgilePageState();
}

class _PorgilePageState extends State<PorfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    final List<String> achievements = [
      "Dias utilizando la app ",
      "Plantas crecidas",
      "Consejos revisados",
      "Tiempo utilizado en la App"
    ];
    final List<String> numlogros = ['16','2','30','4:25H'];

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(30),
        physics: BouncingScrollPhysics(),
        children: [
          PorfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const Text(
            'Logros personales',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          // Lista de logros
          for (int i = 0; i < achievements.length; i++)
            ListTile(
              leading: Text(numlogros[i]), // Mostrar el valor correspondiente de numlogros
              title: Text(achievements[i]),
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'consejos');
            },
            child: Text("Revisar consejos"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          )
        ],
      ),
    );
  }

  Widget buildName(user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      );
}