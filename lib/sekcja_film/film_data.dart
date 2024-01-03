import 'package:flutter/material.dart';

class film_data {
  final String id;
  final String tytul;
  final String gatunek;
  final String rezyser;
  final int czas_trwania;
  final int ocena;
  final String opis_filmu;

  film_data(
      {required this.id,
      required this.tytul,
      required this.gatunek,
      required this.rezyser,
      required this.czas_trwania,
      required this.ocena,
      required this.opis_filmu});
}
