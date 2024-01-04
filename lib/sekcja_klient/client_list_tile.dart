import 'package:flutter/material.dart';

import 'klient_data.dart';

class client_list_tile extends StatefulWidget {
  final klient_data kli_data;
  //final Function(klient_data) modifydata;
  const client_list_tile({Key? key, required this.kli_data, required /*this.modifydata*/});

  @override
  State<client_list_tile> createState() => _client_list_tileState();
}

class _client_list_tileState extends State<client_list_tile> {
  @override
  Widget build(BuildContext context) {
    String titleText = '${widget.kli_data.imie} ${widget.kli_data.nazwisko}';
    return  Container(
      //width: 200,
      child: ListTile(
          title: Text(titleText),
        subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children:[Text("telefon: $widget.kli_data.telefon"),
        Text(widget.kli_data.adres)]),
        ),
      );


  }
}
