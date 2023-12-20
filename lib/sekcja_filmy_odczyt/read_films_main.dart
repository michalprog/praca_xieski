import 'package:flutter/material.dart';

class Read_films extends StatefulWidget {
  final Function(int) manager;
  const Read_films({Key? key, required this.manager}) : super(key: key);

  @override
  State<Read_films> createState() => _Read_filmsState();
}

class _Read_filmsState extends State<Read_films> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child:Text("lista mozliwych filmow")),
    leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
    widget.manager(0);
    },),)
    );
  }
}