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
  List<Widget> widget_list=[];
  @override
  void initState() {
    super.initState();
     widget_list = [
      Client_add(),
      Clients_list(modify: modifyobject),
       Client_remove(),
       Client_remove(),
      //Client_modify(),
    ];
    List<String> title_list = [
      "dodaj klienta",
      "usun klienta",
      "lista_klientow",
      "modyfikuj klienta",
    ];
  }
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
                if(index!=3) {
                  selectedIndex = index;
                }
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
                selectedIcon: Icon(Icons.view_list),
                label: Text('edytuj dane klienta'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.delete),
                selectedIcon: Icon(Icons.delete_outline),
                label: Text('usun klienta'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.list),
                selectedIcon: Icon(Icons.edit_outlined),
                label: Text('lista klientow'),
              )
            ],
          ),
          Expanded(child: Spacer()),
      Expanded(child:widget_list[selectedIndex]),
      Expanded(child:Spacer()),
        ],
      ),
    );
  }
  void modifyobject(klient_data){
    setState(() {
      widget_list[3]=Client_modify(dane_klienta: klient_data);
      selectedIndex=3;
    });
  }
}
