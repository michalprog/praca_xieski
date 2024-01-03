import 'package:flutter/material.dart';
import 'package:xieski_project/sekcja_klient/client_add.dart';
import 'package:xieski_project/sekcja_klient/client_modify.dart';
import 'package:xieski_project/sekcja_klient/client_remove.dart';
import 'package:xieski_project/sekcja_klient/clients.dart';


class Client_section extends StatefulWidget {
  final Function(int) manager;
  const Client_section({Key? key, required this.manager}) : super(key: key);

  @override
  State<Client_section> createState() => _Client_sectionState();
}

class _Client_sectionState extends State<Client_section> {
  int selectedIndex = 0;
  List <Widget> widget_list=[
    Client_add(),
    Client_modify(),
    Client_remove(),
    Clients_list(),

  ];
  List<String> title_list=[
    "dodaj klienta",
    "modyfikuj klienta",
    "usun klienta",
    "lista_klientow",
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("sekcja klienta")),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.manager(0);
          },
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.add),
                selectedIcon: Icon(Icons.add_circle_outline),
                label: Text('dodaj klienta'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.edit),
                selectedIcon: Icon(Icons.edit_outlined),
                label: Text('edytuj dane klienta'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.delete),
                selectedIcon: Icon(Icons.delete_outline),
                label: Text('usun klienta'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.list),
                selectedIcon: Icon(Icons.view_list),
                label: Text('lista klientow'),
              )
            ],
          ),
          Spacer(),
          widget_list[selectedIndex],
          Spacer(),
        ],
      ),
    );
  }
}
