import 'package:flutter/material.dart';
import 'main_window.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Widget actualwidget=Main_window();
  static const List widgets=[Main_window(),];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:actualwidget
    );
  }
  void ChangeWindow(int number){
setState(() {
  actualwidget=widgets[number];
});

  }
}


