import 'package:flutter/material.dart';

class Client_section extends StatefulWidget {
  final Function(int) manager;
  const Client_section({Key? key, required this.manager}) : super(key: key);

  @override
  State<Client_section> createState() => _Client_sectionState();
}

class _Client_sectionState extends State<Client_section> {
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
    );
  }
}
