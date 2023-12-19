
import 'package:flutter/material.dart';
import 'package:xieski_project/Widget_Menager.dart';
import 'package:xieski_project/sekcja_film/film_section.dart';
import 'package:xieski_project/sekcja_filmy_odczyt/read_films_main.dart';
import 'package:xieski_project/sekcja_klient/client_section.dart';
import 'package:xieski_project/sekcja_wypozyczenia/borrow_section.dart';


import 'main_window.dart';

void main() {
  runApp( const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});


  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late List<Widget> widgets;
  late Widget actualWidget;
  @override
  void initState() {
    super.initState();
    widgets =[
      Main_window(manager:changeWindow),
      Film_section(manager:changeWindow),
      Read_films(manager:changeWindow),
      Client_section(manager:changeWindow),
      Borrow_section(manager:changeWindow)];
    actualWidget=widgets[0];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: actualWidget);
  }

  void changeWindow(int number) {
    setState(() {
      actualWidget = widgets[number];
    });
  }


}
