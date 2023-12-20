import 'package:flutter/material.dart';

class Client_section extends StatefulWidget {
  final Function(int) manager;
  const Client_section({Key? key, required this.manager}) : super(key: key);

  @override
  State<Client_section> createState() => _Client_sectionState();
}

class _Client_sectionState extends State<Client_section> {
  int selectedIndex = 0;
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
