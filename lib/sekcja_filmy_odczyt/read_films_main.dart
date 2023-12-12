import 'package:flutter/material.dart';

class Read_films extends StatefulWidget {
  final Function(int) changeWindow;
  const Read_films({super.key,required this.changeWindow});

  @override
  State<Read_films> createState() => _Read_filmsState();
}

class _Read_filmsState extends State<Read_films> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child:Text("lista mozliwych filmow"))),
    );
  }
}