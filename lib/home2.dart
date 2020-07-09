import 'package:flutter/material.dart';
import 'package:tvdominicana/tvprofile.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:tvdominicana/handler/service.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TV"),
      ),
      body: FutureBuilder<List<Canal>>(
          future: fetchCanal(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? CanalList(
                    canales: snapshot.data,
                  )
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class CanalList extends StatelessWidget {
  final List<Canal> canales;
  CanalList({Key key, @required this.canales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: canales.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(canales[index].title),
          subtitle: Text("Canal: " + canales[index].canal),
          leading: Image.network(canales[index].imgUrl),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TvProfile(canal: canales[index]),
              ),
            );
          },
        );
      },
    );
  }
}

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
