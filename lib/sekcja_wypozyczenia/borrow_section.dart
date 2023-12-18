import 'package:flutter/material.dart';

class Borrow_section extends StatefulWidget {
  const Borrow_section({super.key});

  @override
  State<Borrow_section> createState() => _Borrow_sectionState();
}

class _Borrow_sectionState extends State<Borrow_section> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child:Text("lista wypozyczonych filmow"))),
    );
  }
}