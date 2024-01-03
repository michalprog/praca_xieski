import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Film_add extends StatefulWidget {
  const Film_add({super.key});

  @override
  State<Film_add> createState() => _Film_addState();
}

class _Film_addState extends State<Film_add> {
  final TextEditingController tytul = TextEditingController();
  final TextEditingController gatunek = TextEditingController();
  final TextEditingController ryzyser = TextEditingController();
  final TextEditingController czas_trwania = TextEditingController();
  final TextEditingController ocena = TextEditingController();
  final TextEditingController opis_filmu = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
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
                labelText: "Tytul",)
            ),
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
                  labelText: "Gatunek",)
            ),
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
                  labelText: "rezyszer filmu",)
            ),
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
                  labelText: "czas trwania filmu",)
            ),
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
                  labelText: "czas trwania filmu",)
            ),
          ),
          SizedBox(height: 40),
          Container(
            height: 60,
            width: 300,
            child: TextFormField(
                controller: opis_filmu,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "opis filmu:",)
            ),
          ),
          SizedBox(height: 40),
          Container(height: 60,
              width: 300,
              child: ElevatedButton(onPressed: (){},child: Text("dodaj uzytkownika"),))//guzik dodaj film



        ],
      )

    );



  }
}
