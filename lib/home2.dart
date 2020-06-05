import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tvdominicana/tvprofile.dart';

class Homepage extends StatefulWidget {
  @override
  HomepageState createState() => new HomepageState();

}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Televisión"),
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
                      leading:new Image.network(mydata[index]["imgURL"]), 
                      title:
                      Text(
                          mydata[index]["title"],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: new Text("Canal " + mydata[index]["canal"]),
                        onTap: (){
                          print("presionado ");
                          Navigator.push(context, 
                            new MaterialPageRoute(builder: (context)=> TvProfile(),),
                          );
                        },
                    );


                  // return Padding(
                  //   padding: const EdgeInsets.all(15),
                  //   child: new Card(
                      
                  //       child: new Column(
                  //     crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     children: <Widget>[
                  //       Container( 
                  //         width: 10,
                  //         height: 70,
                  //         child: new Image.network(mydata[index]["imgURL"]),
                  //       ),
                  //       //new Image.network(mydata[index]["imgURL"]),
                  //       new Text(mydata[index]["title"],
                  //         style: TextStyle(
                  //             fontSize: 20, fontWeight: FontWeight.bold),
                  //       ),
                  //       new Text("Canal "+ mydata[index]["canal"]),
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

class TVinfo{
  final String title;
    final String canal;
  final String imgURL;

TVinfo(this.title, this.canal, this.imgURL);

}