import 'package:flutter/material.dart';

class tentang extends StatefulWidget {
  @override
  _tentangState createState() => new _tentangState();
}

class _tentangState extends State<tentang> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Tentang"),
        ),
        body: new Center(
            child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                width: 190.0,
                height: 190.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("lib/assets/hehe.jpg")))),
            new Text("", textScaleFactor: 1.5),
            Text("Adhen Kurdi"),
            SizedBox(
              height: 5,
            ),
            Text("Manusia Biasa"),
            SizedBox(
              height: 5,
            ),
            Text(""),
          ],
        )));
  }
}
