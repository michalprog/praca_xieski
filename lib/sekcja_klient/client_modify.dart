import 'package:flutter/material.dart';
import 'package:xieski_project/sekcja_klient/klient_data.dart';

import '../sekcja_konektor/connector.dart';

class Client_modify extends StatefulWidget {
  final klient_data dane_klienta;
  const Client_modify({super.key, required this.dane_klienta});

  @override
  State<Client_modify> createState() => _Client_modifyState();
}

class _Client_modifyState extends State<Client_modify> {
  DatabaseConnector conn = new DatabaseConnector();
  final TextEditingController imie = TextEditingController();
  final TextEditingController nazwisko = TextEditingController();
  final TextEditingController adres = TextEditingController();
  final TextEditingController telefon = TextEditingController();
  @override
  void initState() {
    super.initState();
    imie.text = widget.dane_klienta.imie;
    nazwisko.text = widget.dane_klienta.nazwisko;
    adres.text = widget.dane_klienta.adres;
    telefon.text = widget.dane_klienta.telefon.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 60,
            width: 300,
            child: TextFormField(
                controller: imie,
                maxLength: 40,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "imie",
                )),
          ),
          SizedBox(height: 30),
          Container(
            height: 60,
            width: 300,
            child: TextFormField(
                controller: nazwisko,
                maxLength: 40,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "nazwisko",
                )),
          ),
          SizedBox(height: 30),
          Container(
            height: 60,
            width: 300,
            child: TextFormField(
                controller: adres,
                maxLength: 40,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "adres zamieszkania",
                )),
          ),
          SizedBox(height: 30),
          Container(
            height: 60,
            width: 300,
            child: TextFormField(
                controller: telefon,
                maxLength: 9,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "numer telefonu",
                )),
          ),
          SizedBox(height: 30),
          Container(
              height: 60,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if(imie!=null&&nazwisko!=null&&adres!=null&&telefon!=null) {
                    setState(() {
                      widget.dane_klienta.imie = imie.text;
                      widget.dane_klienta.nazwisko = nazwisko.text;
                      widget.dane_klienta.adres = adres.text;
                      widget.dane_klienta.telefon = int.tryParse(telefon.text) ?? 666;
                      conn.updateklientData(widget.dane_klienta);
                    });
                  }
                },
                child: Text("modyfikuj dane klienta"),
              )) //guzik dodaj klienta
        ],
      ),
    );
  }
}
