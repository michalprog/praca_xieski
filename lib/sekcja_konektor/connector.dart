import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io' show Platform;

import 'package:xieski_project/sekcja_film/film_data.dart';

import '../sekcja_klient/klient_data.dart';

String host = Platform.environment['MONGO_DART_DRIVER_HOST'] ??
    'localhost'; //'127.0.0.1';
String port = Platform.environment['MONGO_DART_DRIVER_PORT'] ?? '27017';
String databaseName = 'biblioteka';

class DB {
  static Db? _db = null;
  static bool _isConnected = false;
  static String _getConnectionString() {
    return "mongodb://$host:$port/$databaseName";
    // return "mongodb://localhost:27017/biblioteka";
  }

  static Future<bool> isConnected() async {
    return _isConnected;
  }

  static Future<Db?> getDB() async {
    try {
      if (_db == null) {
        _db = await Db(_getConnectionString());
        await _db!.open();
      }
      if (_db != null && _db!.isConnected && _db!.state == State.OPEN) {
        _isConnected = true;
        return _db;
      }
      _isConnected = false;
      await _db!.close();
      await _db!.open();
      if (_db != null && _db!.isConnected && _db!.state == State.OPEN) {
        _isConnected = true;
        return _db;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

class DatabaseConnector {
  Future<List<film_data>?> getFilmData() async {
    var dane;

    List<film_data>? lista;
    try {
      Db? db = await DB.getDB();

      var coll = db!.collection("video");
      dane = await coll.find().toList();
      //find({},{_id:1 , tytul:1, gatunek:1 ,rezyser:1 ,czas_trwania:1 ,ocena:1 , opis_filmu:1});
      lista = filmDataListFromJson(dane);
    } catch (e) {
      print(e);
    }

    return lista;
  }

  Future<bool> setklientData(klient_data data) async {
    var res = false;

    try {
      Db? db = await DB.getDB();

      var coll = db!.collection("klient");
      var r = await coll.insertOne(data.toJson());
      res = true;
    } catch (e) {
      res = false;
      print(e);
    }

    return res;
  }

  Future<bool> delklientData(String id_str) async {
    var res = false;

    try {
      final id = ObjectId.fromHexString(id_str);
      Db? db = await DB.getDB();

      var coll = db!.collection("klient");
      var r = await coll.remove({"_id": id});
      res = true;
    } catch (e) {
      res = false;
      print(e);
    }

    return res;
  }

  Future<bool> delFilmData(String id_str) async {
    var res = false;

    try {
      final id = ObjectId.fromHexString(id_str);
      Db? db = await DB.getDB();

      var coll = db!.collection("video");
      var r = await coll.remove({"_id": id});
      res = true;
    } catch (e) {
      res = false;
      print(e);
    }

    return res;
  }

  Future<bool> setFilmData(film_data data) async {
    var res = false;

    try {
      Db? db = await DB.getDB();

      var coll = db!.collection("video");
      var r = await coll.insertOne(data.toJson());
      ObjectId x = r.id;
      data.id = x.toHexString();
      res = true;
    } catch (e) {
      res = false;
      print(e);
    }

    return res;
  }

  Future<List<klient_data>> getKlientData() async {
    var dane;
    List<klient_data> lista = [];
    try {
      Db? db = await DB.getDB();

      var coll = db!.collection("klient");
      dane = await coll.find().toList();
      lista = klientDataListFromJson(dane);
    } catch (e) {
      print(e);
    }

    return lista;
  }

  Future<bool> updateFilmData(film_data data) async {
    var res = false;

    try {
      Db? db = await DB.getDB();
      final id = ObjectId.fromHexString(data.id as String);
      var coll = db!.collection("video");
      var r = await coll.update(
          where.eq("_id", id),
          modify
              .set('tytul', data.tytul)
              .set('gatunek', data.gatunek)
              .set('rezyser', data.rezyser)
              .set("czas_trwania", data.czas_trwania)
              .set("ocena", data.ocena)
              .set("opis_filmu", data.opis_filmu));
      res = true;
    } catch (e) {
      res = false;
      print(e);
    }

    return res;
  }

  Future<bool> updateklientData(klient_data data) async {
    var res = false;

    try {
      Db? db = await DB.getDB();
      final id = ObjectId.fromHexString(data.id as String);
      var coll = db!.collection("klient");
      var r = await coll.update(
          where.eq("_id", id),
          modify
              .set('imie', data.imie)
              .set('nazwisko', data.nazwisko)
              .set('adres', data.adres)
              .set("telefon", data.telefon));
      res = true;
    } catch (e) {
      res = false;
      print(e);
    }

    return res;
  }
}
