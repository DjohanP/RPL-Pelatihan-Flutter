import 'package:flutter/material.dart';
import 'package:noterpl/databasenote.dart';
import 'package:noterpl/note.dart';

class Detailnote extends StatefulWidget {

  final DatabaseNote _manager;
  final Note note;
  final String pilihan;

  Detailnote(this._manager,this.pilihan, {this.note});

  @override
  NoteDetailsWidgetState createState() {
    return new NoteDetailsWidgetState(_manager,pilihan, note);
  }
}

class NoteDetailsWidgetState extends State<Detailnote> {

  final DatabaseNote _manager;
  final Note note;
  final String pilihan;
  final _formKey = new GlobalKey<FormState>();

  String _title;
  String _description;

  NoteDetailsWidgetState(this._manager,this.pilihan,this.note);

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      note == null ?
      _manager.insertNote(new Note(title: _title, descritpion: _description))
          .then((id) => Navigator.pop(context))
          : _manager.updateNote(new Note(title: _title, descritpion: _description, id: note.id))
          .then((id) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:
          pilihan=="Add"?new Text("Add Note"):new Text("Edit Note"),
      ),
      body: new Container(
          margin: new EdgeInsets.all(16.0),
          child: new Form(
              key: _formKey,
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Title",
                          border: InputBorder.none,
                        ),
                        key: new Key("title"),
                        initialValue: note?.title,
                        validator: (val) => val.isNotEmpty ? null : "Title must not be empty",
                        onSaved: (val) => _title = val,
                      ),
                    ),
                    new Container(
                        child: new Divider(
                          color: Colors.black,)),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Description",
                        border: InputBorder.none,
                      ),
                      key: new Key("description"),
                      initialValue: note?.descritpion,
                      validator: (val) => val.isNotEmpty ? null : "Description must not be empty",
                      onSaved: (val) => _description = val,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                    )
                  ]))
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => _submit(),
          child: new Icon(Icons.check)),
    );
  }
}