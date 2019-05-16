import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'Model/User.dart';
import 'package:http/http.dart' as http;
import 'DetailsPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  Future<List<User>> _getData() async{

    var data = await http.get("https://jsonplaceholder.typicode.com/photos");
    var jsonData = json.decode(data.body);
    final List<User>listof=[];
    
    for(var i in jsonData ){
      User user=User(i["index"], i["title"], i["url"]);
      listof.add(user);
    }
    print(listof.length);
    return listof;
  }

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

      body: new Container(

        child: new FutureBuilder(
          future: _getData(),
          builder: (BuildContext c,AsyncSnapshot snapshot){

            if(snapshot.data==null){
              return Container(
                child: new Center(
                  child: new Text("Loading.."),
                ),
              );
            }else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){
                    return new Container(
                      margin: EdgeInsets.all(5.0),
                      child: new Card(
                        elevation: 10.0,

                        child: new Row(
                          children: <Widget>[

                            new Container(
                              padding: EdgeInsets.all(15.0),
                              child: new CircleAvatar(
                                backgroundImage: new NetworkImage(
                                  snapshot.data[index].url
                                ),
                              ),
                            ),
                            new SizedBox(width: 10.0,),
                            new Container(
                              padding: EdgeInsets.all(10.0),
                              width: 250.0,
                              child: InkWell(
                                child: new Text(snapshot.data[index].title,
                                maxLines: 2,
                                style: TextStyle(fontSize: 20.0,
                                color: Colors.brown
                                ),
                                ),
                                onTap: (){
                                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext c)=>Detail(snapshot.data[index])));
                                },
                              ),
                            )

                          ],
                        ),
                      ),
                    );
                  }
              );
            }

          }
        ),
      ),

    );
  }
}

