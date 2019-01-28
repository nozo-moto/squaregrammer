import 'package:flutter/material.dart';
import 'dart:ui' as ui show Image, Canvas, PictureRecorder;
import 'dart:io';

class SquareCanvas extends StatefulWidget {
  final FileImage image;

  SquareCanvas(this.image);

  @override
  _SquareCanvasState createState() => _SquareCanvasState(image);
}

class _SquareCanvasState extends State<SquareCanvas> {
  final FileImage image;
  _SquareCanvasState(this.image);

  static var recorder = new ui.PictureRecorder();
  var canvas = new Canvas(recorder, new Rect.fromLTWH(0, 0, 300, 300));

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: <Widget>[
        SizedBox(
          width: 400,
          height: 400,
          child: Container(
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 400,
          height: 400,
          child: Container(
            child: Image.asset(
              createOverrayImage(Size(400, 400), image, image),
            )
          ),
        )
      ],
    ));
  }
}

ui.Image createOverrayImage(Size size, FileImage fileimage, FileImage backgrounimage) {
  final recorder = ui.PictureRecorder();
  final cullRect = Offset.zero & size;
  final canvas = ui.Canvas(recorder, cullRect);
  Offset p = Offset(10, 10);
  canvas.drawImage(fileimage as ui.Image, p, new Paint());

  final picture = recorder.endRecording();
  final image = picture.toImage(size.width.toInt(), size.height.toInt());

  return image;
}
