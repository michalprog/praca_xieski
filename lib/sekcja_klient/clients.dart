import 'package:flutter/material.dart';
import '../sekcja_konektor/connector.dart';
import 'client_list_tile.dart';
import 'klient_data.dart';

class Clients_list extends StatefulWidget {
  final Function(klient_data) modify;
  const Clients_list({Key? key, required this.modify}) : super(key: key);

  @override
  _Clients_listState createState() => _Clients_listState();
}

class _Clients_listState extends State<Clients_list> {
  DatabaseConnector conn = new DatabaseConnector();
  late Future<List<klient_data>> data_list;
  List<klient_data> lista = [];

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<klient_data>>(
      future: data_list,
      builder: (BuildContext context, AsyncSnapshot<List<klient_data>> snapshot) {
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
                  kli_data: lista[index], modifydata: widget.modify,
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
