import 'package:flutter/material.dart';

class Client_add extends StatefulWidget {
  const Client_add({super.key});

  @override
  State<Client_add> createState() => _Client_addState();
}

class _Client_addState extends State<Client_add> {
  final TextEditingController imie = TextEditingController();
  final TextEditingController nazwisko = TextEditingController();
  final TextEditingController adres = TextEditingController();
  final TextEditingController telefon = TextEditingController();
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
          Container(height: 60,
              width: 300,
              child: ElevatedButton(onPressed: (){},child: Text("dodaj klienta"),)) //guzik dodaj klienta
        ],
      ),
    );
  }
}
