import 'package:flutter/material.dart';

import 'klient_data.dart';

class client_list_tile extends StatefulWidget {
  final klient_data kli_data;
  final Function(klient_data) modifydata;
  const client_list_tile({Key? key, required this.kli_data, required this.modifydata});

  @override
  State<client_list_tile> createState() => _client_list_tileState();
}

class _client_list_tileState extends State<client_list_tile> {
  @override
  Widget build(BuildContext context) {
    String titleText = '${widget.kli_data.imie} ${widget.kli_data.nazwisko}';
    return  GestureDetector(
      onDoubleTap: () {
      widget.modifydata(widget.kli_data);

      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: ListTile(
            title: Text(titleText),
          subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children:[Text("telefon: ${widget.kli_data.telefon}"),
          Text(widget.kli_data.adres)]),
          ),
      ),
      );


  }
}
