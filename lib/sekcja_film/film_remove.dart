import 'package:flutter/material.dart';

import '../sekcja_konektor/connector.dart';
import 'film_data.dart';
import 'film_list_tile.dart';
class Film_remove extends StatefulWidget {
  const Film_remove({super.key});

  @override
  State<Film_remove> createState() => _Film_removeState();
}

class _Film_removeState extends State<Film_remove> {
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
  Widget build(BuildContext context) {
    return FutureBuilder<List<film_data>>(
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
                  fildata:lista[index] , modifydata: deletedata ,
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
  void deletedata(klient_data){
    setState(() {
      conn.delFilmData(klient_data.id);
    });
  }
}
