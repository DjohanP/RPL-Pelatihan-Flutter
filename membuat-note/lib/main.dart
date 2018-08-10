import 'package:flutter/material.dart';
import 'package:noterpl/databasenote.dart';
import 'package:noterpl/detailnote.dart';
import 'package:noterpl/note.dart';

void main(){
  runApp(
    new MaterialApp(
      title: "Note RPL",
      debugShowCheckedModeBanner: false,
      home: new MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DatabaseNote databaseNote =new DatabaseNote();
  List<Note>notes;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List Note"),
      ),
      floatingActionButton: new FloatingActionButton(
        //onPressed: null,
        onPressed: () =>
          Navigator.of(context)
            .push(new MaterialPageRoute(builder: (_) => new Detailnote(databaseNote,'Add'))),
        child: new Icon(Icons.add)
      ),
      body: new FutureBuilder(
        future: databaseNote.getNotes(),
        builder: (context, snapshot){
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          //print(snapshot.data);
          return new ItemList(notes:snapshot.data);
        }
      ),
    
    );
  }
}

class ItemList extends StatelessWidget {
  final DatabaseNote databaseNote =new DatabaseNote();
  final List<Note>notes;
  ItemList({this.notes});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: notes == null ? 0 : notes.length,
      itemBuilder: (context, i) {
        return new Dismissible(
          key: new UniqueKey(),
          onDismissed: (direction) {
            databaseNote.deleteNote(notes[i].id)
            .then((dynamic) => print("Deleted!"));
          },
          child:new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () {
                Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (_) => new Detailnote(databaseNote,"Edit", note: notes[i])));
              },
              child: new Card(
                child: new ListTile(
                  title: new Text(notes[i].title),
                  leading: new Icon(Icons.widgets),
                  subtitle: new Text(notes[i].descritpion.length > 50
                    ? notes[i].descritpion.substring(0, 50)
                    : notes[i].descritpion),
                ),
              ),
            ),

          )
        );
      },

    );
  }
}
