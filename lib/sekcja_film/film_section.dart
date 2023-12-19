import 'package:flutter/material.dart';

class Film_section extends StatefulWidget {
  final Function(int) manager;

  const Film_section({Key? key, required this.manager}) : super(key: key);

  @override
  State<Film_section> createState() => _Film_sectionState();
}

class _Film_sectionState extends State<Film_section> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child:Text("sekcja filmow"))),
    );
  }
}
