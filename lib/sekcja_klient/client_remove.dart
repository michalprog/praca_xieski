import 'package:flutter/material.dart';
import 'package:xieski_project/sekcja_klient/client_list_tile.dart';

import '../sekcja_konektor/connector.dart';
import 'klient_data.dart';
class Client_remove extends StatefulWidget {
  const Client_remove({super.key});

  @override
  State<Client_remove> createState() => _Client_removeState();
}

class _Client_removeState extends State<Client_remove> {
  DatabaseConnector conn = new DatabaseConnector();
  late Future<List<klient_data>> data_list;
  List<klient_data> lista = [];
  @override
  @override
  void initState() {
    super.initState();
    data_list = conn.getKlientData();

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
    return FutureBuilder<List<klient_data>>(
      future: data_list,
      builder: (BuildContext context, AsyncSnapshot<List<klient_data>> snapshot) { // Zaktualizowany typ AsyncSnapshot
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

                return client_list_tile(
                  kli_data: lista[index], modifydata: deletedata,
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
  conn.delklientData(klient_data.id);
});
  }
}


