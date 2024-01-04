import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xieski_project/sekcja_film/film_data.dart';
import 'package:xieski_project/sekcja_klient/klient_data.dart';

import '../sekcja_konektor/connector.dart';

class Film_modify extends StatefulWidget {
  final film_data dane_filmu;
  const Film_modify({
    super.key,
    required this.dane_filmu,
  });

  @override
  State<Film_modify> createState() => _Film_modifyState();
}

class _Film_modifyState extends State<Film_modify> {
  DatabaseConnector conn = new DatabaseConnector();
  final TextEditingController tytul = TextEditingController();
  final TextEditingController gatunek = TextEditingController();
  final TextEditingController ryzyser = TextEditingController();
  final TextEditingController czas_trwania = TextEditingController();
  final TextEditingController ocena = TextEditingController();
  final TextEditingController opis_filmu = TextEditingController();
  @override
  void initState() {
    super.initState();
    tytul.text = widget.dane_filmu.tytul;
    gatunek.text = widget.dane_filmu.gatunek;
    ryzyser.text = widget.dane_filmu.rezyser;
    czas_trwania.text = widget.dane_filmu.czas_trwania.toString();
    ocena.text = widget.dane_filmu.ocena.toString();
    opis_filmu.text = widget.dane_filmu.opis_filmu;
  }

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
                  setState(() {
                    widget.dane_filmu.tytul = tytul.text;
                    widget.dane_filmu.gatunek = gatunek.text;
                    widget.dane_filmu.rezyser = ryzyser.text;
                    widget.dane_filmu.czas_trwania =
                        int.tryParse(czas_trwania.text) ?? 120;
                    widget.dane_filmu.ocena =
                        int.tryParse(ocena.text) ?? 2;
                    widget.dane_filmu.opis_filmu = opis_filmu.text;
                    conn.updateFilmData(widget.dane_filmu );
                    // Dodaj tutaj swój kod aktualizacji danych filmu
                  });
                }
              },
              child: Text("modyfikuj dane uzytkownika"),
            )) //guzik dodaj film
      ],
    ));
  }
}
