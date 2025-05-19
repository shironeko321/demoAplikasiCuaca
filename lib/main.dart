import 'package:demo/themes/navy_blue.dart';
import 'package:demo/views/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: materialYouBlueNightTheme, home: const MainApp());
  }
}
