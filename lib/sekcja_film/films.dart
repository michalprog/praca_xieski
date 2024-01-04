import 'package:flutter/material.dart';

import '../sekcja_konektor/connector.dart';
import 'film_data.dart';
import 'film_list_tile.dart';
class Films_list extends StatefulWidget {
  final Function(film_data) modify;
  const Films_list({super.key, required this.modify});

  @override
  State<Films_list> createState() => _Films_listState();
}

class _Films_listState extends State<Films_list> {
  DatabaseConnector conn = new DatabaseConnector();
  late Future<List<film_data>> data_list;
  List<film_data> lista = [];
  @override
  void initState() {
    super.initState();
    data_list = conn.getFilmData();

    // Przypisanie wyniku z Future do listy
    data_list.then((list) {
      setState(() {
        lista = list;
      });
    }).catchError((error) {
      print('Wystąpił błąd: $error');
    });
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<film_data>>(
      future: data_list,
      builder: (BuildContext context, AsyncSnapshot<List<film_data>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Wystąpił błąd: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (BuildContext context, int index) {

                return film_list_tile(
                 fildata:lista[index] , modifydata:widget.modify ,
                );
              },
            ),
          );
        } else {
          return Center(child: Text('Brak danych'));
        }
      },
    );
  }
}
