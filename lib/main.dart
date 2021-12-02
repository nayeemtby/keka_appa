import 'package:flutter/material.dart';

import 'home.dart';

void main(List<String> args) {
  runApp(const KekaAppa());
}

class KekaAppa extends StatelessWidget {
  const KekaAppa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeHome(),
    );
  }
}
