import 'package:flutter/material.dart';
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
  Widget actualwidget = Main_window();
  static const List widgets = [
    Main_window(),
    Film_section(),
    Read_films(),
    Client_section(),
    Borrow_section()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: actualwidget);
  }

  void changeWindow(int number) {
    setState(() {
      actualwidget = widgets[number];
    });
  }
}
