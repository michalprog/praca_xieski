import 'package:flutter/material.dart';

class Film_section extends StatefulWidget {
  final Function(int) changeWindow;

  const Film_section({super.key,required this.changeWindow});

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
