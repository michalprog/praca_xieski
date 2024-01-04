import 'package:flutter/material.dart';
import 'package:xieski_project/sekcja_film/film_data.dart';

class film_list_tile extends StatefulWidget {
  final film_data fildata;
final Function(film_data) modifydata;
  const film_list_tile({super.key, required this.fildata, required this.modifydata});

  @override
  State<film_list_tile> createState() => _film_list_tileState();
}

class _film_list_tileState extends State<film_list_tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        widget.modifydata(widget.fildata);

      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: ListTile(
          title: Text(widget.fildata.tytul),
          subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[Text("Gatunek: ${widget.fildata.gatunek} ,rezyser: ${widget.fildata.rezyser} "),
                Text("czas trwania: ${widget.fildata.czas_trwania} , ocena: ${widget.fildata.ocena}"),
              Text("opis_filmu:${widget.fildata.opis_filmu}")],
        ),
      ),
    ));
  }
}
