import 'package:flutter/material.dart';

class Read_films extends StatefulWidget {
  const Read_films({super.key});

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