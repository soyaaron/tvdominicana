import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tvdominicana/tvprofile.dart';
import 'package:tvdominicana/model/model.dart';

class Homepage extends StatefulWidget {
  @override
  HomepageState createState() => new HomepageState();
}

class HomepageState extends State<Homepage> {
 
 final dataCanal = dataCanalFromJson('assets/test.json');
 
  // List data;

  // Future<String> loadJson() async {
  //   var jsonText = await rootBundle.loadString('assets/test.json');

  //   setState(() {
  //     data = json.decode(jsonText);
  //   });
  // }

  // @override
  // void initState() {
  //   this.loadJson();
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Televisión"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            builder: (context, snapshot) {
              return new ListView.builder(
               // itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: new Image.network(dataCanal["imgURL"]),
                    title: Text(
                      data[index]["title"],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: new Text("Canal " + data[index]["canal"]),
                    onTap: () {
                      print("presionado ");
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => TvProfile(),
                        ),
                      );
                    },
                  );
                },

                //  itemCount: data == null ? 0 : data.length,
              );
            },
          ),
        ),
      ),
    );
  }
}

//Decode
//      var data = json.decode(snapshot.data.toString());

//CARD CONCEPT

// return Padding(
//   padding: const EdgeInsets.all(15),
//   child: new Card(

//       child: new Column(
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//     children: <Widget>[
//       Container(
//         width: 10,
//         height: 70,
//         child: new Image.network(data[index]["imgURL"]),
//       ),
//       //new Image.network(data[index]["imgURL"]),
//       new Text(data[index]["title"],
//         style: TextStyle(
//             fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       new Text("Canal "+ data[index]["canal"]),
//     ],

//   )

//   ),
// );
