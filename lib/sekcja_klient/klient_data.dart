import 'package:flutter/material.dart';


import 'dart:convert';

List<klient_data> klientDataFromJson(String str) => List<klient_data>.from(json.decode(str).map((x) => klient_data.fromJson(x)));

String klientDataToJson(List<klient_data> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<klient_data> klientDataListFromJson(List<dynamic> str) =>
    List<klient_data>.from(str.map((x) => klient_data.fromJson(x)));

class klient_data {
   String? id;
  final String imie;
  final String nazwisko;
  final String adres;
  final int telefon;

  klient_data(
      { this.id,
      required this.imie,
      required this.nazwisko,
      required this.adres,
      required this.telefon});

  factory klient_data.fromJson(Map<String, dynamic> json) => klient_data(
    id: json['_id'].$oid.toString(),//json["id"],
    imie: json["imie"],
    nazwisko: json["nazwisko"],
    adres: json["adres"],
    telefon: json["telefon"],
    );

  Map<String, dynamic> toJson() => {
    "imie": imie,
    "nazwisko": nazwisko,
    "adres": adres,
    "telefon": telefon,
    "data_rejestracji": DateTime.now().toIso8601String(),
  };
}
