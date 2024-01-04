import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xieski_project/sekcja_film/film_data.dart';
import 'package:xieski_project/sekcja_konektor/connector.dart';

class Film_add extends StatefulWidget {
  const Film_add({super.key});

  @override
  State<Film_add> createState() => _Film_addState();
}

class _Film_addState extends State<Film_add> {
  DatabaseConnector conn = new DatabaseConnector();
  final TextEditingController tytul = TextEditingController();
  final TextEditingController gatunek = TextEditingController();
  final TextEditingController ryzyser = TextEditingController();
  final TextEditingController czas_trwania = TextEditingController();
  final TextEditingController ocena = TextEditingController();
  final TextEditingController opis_filmu = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 300,
          child: TextFormField(
              controller: tytul,
              maxLength: 40,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Tytul",
              )),
        ),
        SizedBox(height: 40),
        Container(
          height: 60,
          width: 300,
          child: TextFormField(
              controller: gatunek,
              maxLength: 40,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Gatunek",
              )),
        ),
        SizedBox(height: 40),
        Container(
          height: 60,
          width: 300,
          child: TextFormField(
              controller: ryzyser,
              maxLength: 40,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "rezyszer filmu",
              )),
        ),
        SizedBox(height: 40),
        Container(
          height: 60,
          width: 300,
          child: TextFormField(
              controller: czas_trwania,
              maxLength: 40,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "czas trwania filmu",
              )),
        ),
        SizedBox(height: 40),
        Container(
          height: 60,
          width: 300,
          child: TextFormField(
              controller: ocena,
              maxLength: 2,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("^(1[0-0]|[1-9])\$")),
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "ocena filmu",
              )),
        ),
        SizedBox(height: 40),
        Container(
          height: 60,
          width: 300,
          child: TextFormField(
              controller: opis_filmu,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "opis filmu:",
              )),
        ),
        SizedBox(height: 40),
        Container(
            height: 60,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                if (tytul != null &&
                    gatunek != null &&
                    ryzyser != null &&
                    czas_trwania != null &&
                    ocena != null &&
                    opis_filmu != null) {
                  film_data flmdata = new film_data(
                      tytul: tytul.text,
                      gatunek: gatunek.text,
                      rezyser: ryzyser.text,
                      czas_trwania: int.tryParse(czas_trwania.text) ?? 120,
                      ocena: int.tryParse(ocena.text) ?? 2,
                      opis_filmu: opis_filmu.text);
                  setState(() {
                    conn.setFilmData(flmdata);
                    // Dodaj tutaj swój kod aktualizacji danych filmu
                  });
                }
              },
              child: Text("dodaj uzytkownika"),
            )) //guzik dodaj film
      ],
    ));
  }
}
