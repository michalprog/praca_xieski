import 'package:flutter/material.dart';
import 'dart:convert';

List<film_data> filmDataFromJson(String str) => List<film_data>.from(json.decode(str).map((x) => film_data.fromJson(x)));

String filmDataToJson(List<film_data> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<film_data> filmDataListFromJson(List<dynamic> str) =>
    List<film_data>.from(str.map((x) => film_data.fromJson(x)));


class film_data {
   String? id;
   String tytul;
   String gatunek;
   String rezyser;
   int czas_trwania;
   int ocena;
   String opis_filmu;

  film_data(
      { this.id,
      required this.tytul,
      required this.gatunek,
      required this.rezyser,
      required this.czas_trwania,
      required this.ocena,
      required this.opis_filmu});

  factory film_data.fromJson(Map<String, dynamic> json) => film_data(
    id: json['_id'].$oid.toString(),//json["id"],
    tytul: json["tytul"],
    gatunek: json["gatunek"],
    rezyser: json["rezyser"],
    czas_trwania: json["czas_trwania"],
    ocena: json["ocena"],
    opis_filmu: json["opis_filmu"],
  );

  Map<String, dynamic> toJson() => {
    //"id": id,
    "tytul": tytul,
    "gatunek": gatunek,
    "rezyser": rezyser,
    "czas_trwania": czas_trwania,
    "ocena": ocena,
    "opis_filmu": opis_filmu,
    "data_dodania": DateTime.now().toIso8601String(),
  };



}
