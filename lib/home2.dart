import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tvdominicana/tvprofile.dart';

class Homepage extends StatefulWidget {
  @override
  HomepageState createState() => new HomepageState();
  List data;
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("TV Dominicana"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('assets/test.json'),
            builder: (context, snapshot) {
              //Decode
              var mydata = json.decode(snapshot.data.toString());
              return new ListView.builder(

                itemBuilder: (BuildContext context, int index) {

                    return ListTile(
                      title:Text(
                          "Name: " + mydata[index]["title"],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: new Text(mydata[index]["subtitulo"]),
                        onTap: (){
                          print("object");
                          new MaterialPageRoute(builder: (context)=> TvProfile());
                        },
                    );


                  // return Padding(
                  //   padding: const EdgeInsets.all(15),
                  //   child: new Card(
                      
                  //       child: new Column(
                  //     crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     children: <Widget>[
                  //       new Text(
                  //         "Name: " + mydata[index]["title"],
                  //         style: TextStyle(
                  //             fontSize: 20, fontWeight: FontWeight.bold),
                  //       ),
                  //       new Text(mydata[index]["subtitulo"]),
                  //     ],
                    
                  //   )
                    
                  //   ),
                  // );
                },
                 
                itemCount: mydata == null ? 0 : mydata.length,
              
              );
            },
          ),
        ),
      ),
    );
  }
}

