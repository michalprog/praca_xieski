import 'package:flutter/material.dart';

class Client_section extends StatefulWidget {
  final Function(int) changeWindow;
  const Client_section({super.key,required this.changeWindow});

  @override
  State<Client_section> createState() => _Client_sectionState();
}

class _Client_sectionState extends State<Client_section> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child:Text("sekcja klienta"))),
    );
  }
}