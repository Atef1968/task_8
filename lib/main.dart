import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const Task8());
}

class Task8 extends StatelessWidget {
  const Task8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
