import 'package:flutter/material.dart';
import 'package:xieski_project/Widget_Menager.dart';
import 'package:xieski_project/sekcja_film/film_data.dart';
import 'package:xieski_project/sekcja_film/film_section.dart';
import 'package:xieski_project/sekcja_filmy_odczyt/read_films_main.dart';
import 'package:xieski_project/sekcja_klient/client_section.dart';
import 'package:xieski_project/sekcja_klient/klient_data.dart';
import 'package:xieski_project/sekcja_konektor/connector.dart';
import 'package:xieski_project/sekcja_wypozyczenia/borrow_section.dart';

import 'main_window.dart';

void main() async {
 // DatabaseConnector conn = DatabaseConnector();

  // conn.getFilmData();
//  conn.getKlientData();

 /* conn.setFilmData(film_data (
      tytul: "tytul",
      gatunek: "gatunek",
      rezyser: "rezyser",
      czas_trwania: 1,
      ocena: 1,
      opis_filmu: "opis_filmu") );
      */

/*
conn.setklientData(klient_data(imie:
"Michal",
    nazwisko:
    "szklorz",
    adres:
    "zabrze berdianskiego 11",
    telefon:
    456708904));
*/
  //conn.delFilmData("6595dfb76280c6693b7ba9b0");
  // conn.delklientData("6584765be95663f30ea4280e");

  /* conn.updateFilmData(film_data (
    id:"6595df806b90605ad2b6197d",
  tytul: "tytul2",
  gatunek: "gatunek",
  rezyser: "rezyser",
  czas_trwania: 1,
  ocena: 1,
  opis_filmu: "opis_filmu") );
*/
  /*conn.updateklientData(klient_data(
    id:"6595e199f98009a8fa112f1e",
      imie: "Halina",
      nazwisko: "szklorz",
      adres: "zabrze berdianskiego 11",
      telefon: 456708904));*/
  runApp(const MainApp());
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
    widgets = [
      Main_window(manager: changeWindow),
      Read_films(manager: changeWindow),
      Borrow_section(manager: changeWindow),
      Client_section(manager: changeWindow),
      Film_section(manager: changeWindow),
    ];
    actualWidget = widgets[0];
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
