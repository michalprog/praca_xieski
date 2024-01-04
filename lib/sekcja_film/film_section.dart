import 'package:flutter/material.dart';
import 'package:xieski_project/sekcja_film/film_add.dart';
import 'package:xieski_project/sekcja_film/film_modify.dart';
import 'package:xieski_project/sekcja_film/film_remove.dart';
import 'package:xieski_project/sekcja_film/films.dart';

class Film_section extends StatefulWidget {
  final Function(int) manager;

  const Film_section({Key? key, required this.manager}) : super(key: key);

  @override
  State<Film_section> createState() => _Film_sectionState();
}

class _Film_sectionState extends State<Film_section> {
  int selectedIndex = 0;
  List <Widget> widget_list=[
    Film_add(),
    Film_remove(),
    Films_list(),
    Films_list(),
    //Film_modify(),
  ];
  List<String> title_list=[
    "dodaj film",
    "usun film",
    "lista filmow do modyfikacji",
    "modyfikuj film",
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:Center(child:Text(title_list[selectedIndex])),
    leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
    widget.manager(0);
    },),),
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
                label: Text('dodaj film'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.edit),
                selectedIcon: Icon(Icons.edit_outlined),
                label: Text('edytuj dane filmu'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.delete),
                selectedIcon: Icon(Icons.delete_outline),
                label: Text('usun film'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.list),
                selectedIcon: Icon(Icons.view_list),
                label: Text('lista filmow'),
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
