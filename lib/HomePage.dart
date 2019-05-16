import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Json Parsing"),
        backgroundColor: Colors.brown,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: ()=>debugPrint("search")
          ),
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: ()=>debugPrint("add")
          )
        ],
      ),

    );
  }
}

