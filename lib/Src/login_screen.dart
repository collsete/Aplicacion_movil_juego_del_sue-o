
import 'dart:ffi';

import 'package:flutter/material.dart';
class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
        color: Colors.green[300],
        width: double.infinity,
        child: Column(
        children: [
          const SizedBox(height: 40,),
          const Icon(
            Icons.supervised_user_circle_outlined, size:200,
            color: Colors.white,
            ),
            Expanded(child: Container()),
            Padding( 
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child:Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text('Ingrese usuario', style: TextStyle(
                        color: Colors.green[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 20, 
                        )
                       ,),
                       const SizedBox (height: 25,),
                       TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.mail),
                          hintText:'Correo electronico'

                        ) ,
                       ),
                       const SizedBox(height: 25,),
                       TextFormField(
                        obscureText: true,
                          decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          hintText:'Contraseña'
                        ),
                       ),
                       const SizedBox(height: 30,),
                       ElevatedButton(onPressed:() {
                        Navigator.pushNamed(context, 'main');
                       } , child: const Text('ingresar')),
                    ],
                  ),
                ) ,
              ),
            ),
              TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              }, 
              child:const Text('registrar nueva cuenta', 
              style: TextStyle(color: Colors.white),)),
           const  SizedBox(height: 30,),
        ],
      ),
    )

    );

  }
}
