import 'package:meta/meta.dart';//required
//import 'package:sqflite/sqflite.dart';
//import 'package:path_provider/path_provider.dart';
final String TITLE = "title";
final String DESCRIPTION = "description";

class Note{
  int id;
  String title;
  String descritpion;

  Note({@required this.title, @required this.descritpion, this.id});

  Map<String,String>toMap(){
    Map<String, String> map = {TITLE: title, DESCRIPTION: descritpion};
    return map;
  }

  Note.fromMap(Map map){
    id = map["_id"];
    title = map["title"];
    descritpion = map["description"];
  }

  @override
  bool operator ==(other) {
    return other is Note && other.title == title && other.descritpion == descritpion && other.id == id;
  }
}