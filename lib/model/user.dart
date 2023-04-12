import 'package:flutter/material.dart';

class User {
  final String imagePath;
  final String name;
  final String email;
  final List <String> logros;
  
  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.logros
  });
}