import 'package:flutter/material.dart';
import 'Model/User.dart';

class Detail extends StatelessWidget {
  User user;
  Detail(this.user);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Detail Page"),
        backgroundColor: Colors.brown,
      ),

      body: new Column(
        children: <Widget>[

          new Image.network(user.url),
          new SizedBox(height: 10.0,),
          new Text(user.title,style: TextStyle(fontSize: 18.0),),
          new SizedBox(height: 10.0,),
          new Text(user.index.toString(),style: TextStyle(fontSize: 15.0),)

        ],
      ),

    );
  }
}


