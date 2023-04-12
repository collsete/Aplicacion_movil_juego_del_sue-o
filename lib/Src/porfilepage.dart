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

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          PorfileWidget(
            imagePath: user.imagePath,
             onClicked: ()async{},
            )
        ],
      ),
    );
  }
}
