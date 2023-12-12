import 'package:mongo_dart/mongo_dart.dart';
class Connector{
 late Db db = Db("mongodb://localhost:27017/biblioteka");

 Future<void> connect() async {
  await _db.open();
 }

}
