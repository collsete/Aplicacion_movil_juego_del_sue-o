
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

 @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;
  int _imageIndex = 0;
  int _coinCount = 26;
  List<String> _imageList = [
    'https://media.discordapp.net/attachments/930235757912817714/1126214892282712064/Proyecto_nuevo_4.png?width=194&height=324',
  ];

  bool _isButtonEnabled = true;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(days: 3), (Timer t) => _changeImage());
  }

  void _changeImage() {
    setState(() {
      _imageIndex = (_imageIndex + 1) % _imageList.length;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  color: Colors.amber,
                  width: 3.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$_coinCount',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.monetization_on_rounded,
                    size: 24.0,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Image.network(
              _imageList[_imageIndex],
              width: 300,
              height: 300,
            ),
            SizedBox(height: 32),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
                          primary: _isButtonEnabled ? Color.fromARGB(255, 177, 160, 9) : Colors.grey, // Cambiar a amarillo o gris según el estado del botón
              ),
              onPressed: _isButtonEnabled
                  ? () {
                      setState(() {
                        _coinCount++;
                        _isButtonEnabled = false;
                      });
                    }
                  : null, // Desactivar el botón cuando no está habilitado
              child: Text(
                'Recibir recompensa diaria',
                style: TextStyle(
                  decoration: _isButtonEnabled ? null : TextDecoration.lineThrough, // Tachar la palabra cuando el botón esté desactivado
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}