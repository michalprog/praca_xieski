import 'package:flutter/material.dart';

class Borrow_section extends StatefulWidget {
  final Function(int) manager;

  const Borrow_section({Key? key, required this.manager}) : super(key: key);

  @override
  State<Borrow_section> createState() => _Borrow_sectionState();
}

class _Borrow_sectionState extends State<Borrow_section> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("lista wypozyczonych filmow")),
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
                icon: Icon(Icons.cancel),
                selectedIcon: Icon(Icons.cancel_outlined),
                label: Text('x'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.cancel),
                selectedIcon: Icon(Icons.cancel_outlined),
                label: Text('x'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.cancel),
                selectedIcon: Icon(Icons.cancel_outlined),
                label: Text('x'),
              ),

            ],
          )
        ],
      ),
    );
  }
}