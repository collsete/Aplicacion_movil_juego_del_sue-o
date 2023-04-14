import 'package:flutter/material.dart';
import 'package:tesis/utils/user_preferences.dart';
import 'package:tesis/widgets/porfileWidger.dart';

class PorfilePage extends StatefulWidget {
  const PorfilePage({super.key});

  @override
  State<PorfilePage> createState() => _PorgilePageState();
}

class _PorgilePageState extends State<PorfilePage> {
  @override
  Widget build(BuildContext context) {
    final user= UserPreferences.myUser;
    final List<String> achievements = [     
       "Ganador del primer lugar en el torneo de ajedrez del club",      
       "Mejor promedio del semestre en la carrera de Ingeniería",     
        "Reconocimiento por desempeño sobresaliente en la empresa X",     
         "Voluntario en la Cruz Roja durante 3 años",    ];

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(30),
        physics: BouncingScrollPhysics(),
        children: [
          PorfileWidget(
            imagePath: user.imagePath,
             onClicked: ()async{},
            ),
            const SizedBox( height: 24),
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
          for (final achievement in achievements)
            ListTile(
              leading: Icon(Icons.star),
              title: Text(achievement),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Revisar consejos"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)
            )
        ],        
      ),
    );
  }
Widget buildName (user)=> Column(
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
