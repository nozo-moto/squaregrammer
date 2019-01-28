import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:squaregrammer/canvas.dart' as c;

void main() => runApp(MyApp());
const TITLE = 'SquareGrammer';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
        accentColor: Colors.yellow,
      ),
      home: MyHomePage(title: TITLE),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  FileImage _image;

  Future getImage() async {
    var image = await ImagePicker.PickImage(source: ImageSource.gallery);
    setState(() {
      _image = image as FileImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          GestureDetector(
            onTap: getImage,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.photo_album),
            ),
          )
        ],
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.green[50]),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: _image == null
                    ? Text('select image')
                    : c.SquareCanvas(_image),
              )
            ],
          ),
        ),
      ),
    );
  }
}
