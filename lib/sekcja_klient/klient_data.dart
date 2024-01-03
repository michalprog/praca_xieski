import 'package:flutter/material.dart';

class Klient_data {
  final String id;
  final String imie;
  final String nazwisko;
  final String adres;
  final int telefon;

  Klient_data(
      {required this.id,
      required this.imie,
      required this.nazwisko,
      required this.adres,
      required this.telefon});
}
