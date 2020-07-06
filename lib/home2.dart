import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tvdominicana/tvprofile.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:tvdominicana/handler/service.dart';
import 'dart:async' show Future;
import 'package:http/http.dart' as http;



class Homepage extends StatelessWidget{

   final List<Canal> canal;
  Homepage({Key key, this.canal}):super(key:key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("TV"),
      ),
      body: FutureBuilder<List<Canal>>(
        future: fetchCanal(),
        builder:(context, snapshot){
          return ListView.builder(
            itemCount: canal.length,
            itemBuilder:(context, index){
            return ListTile(
              title: Text(canal[index].title),
            );
            },
          );
      }),
    );
  }
}

// class Homepage extends StatefulWidget {
//   @override
//   HomepageState createState() => new HomepageState();
// }

// class HomepageState extends State<Homepage> {

// var canal = Canal.fromJson(canalMap);
//    List data;

//   HomepageState ({Key key, this.canal});
//   Future<String> loadJson() async {
//     var jsonText = await rootBundle.loadString('assets/test.json');

//   //   setState(() {
//   //     data = json.decode(jsonText);
//   //   });
//   // }
//   //   @override
//   // void initState() {
//   //   this.loadJson();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         title: Text("Televisión"),
//       ),
//       body: new Container(
//         child: new Center(
//           future:DataHandle.fetchCanalData(),
//             builder: (context, snapshot) {
//               return  ListView(
//                 itemCount: canal.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                    // leading: new Image.network(canal[index].imgurl),
//                     title: Text(
//                       data[index].title,
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: new Text("Canal " + data[index].canal),
//                     onTap: () {
//                       print("presionado ");
//                       Navigator.push(
//                         context,
//                         new MaterialPageRoute(
//                           builder: (context) => TvProfile(),
//                         ),
//                       );
//                     },
//                   );
//                 },

//               );
//             },
  
//         ),
//       ),
//     );
//   }
// }

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
