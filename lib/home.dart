import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

// Future<String> fetchPhotos() async {
//     return await rootBundle.loadString('assets/test.json');

// }
// // Future<List<Photo>> fetchPhotos(http.Client client) async {

// //   // final response =
// //   //     await client.get('assets/test.json');

// //   // // Use the compute function to run parsePhotos in a separate isolate.
// //   // return compute(parsePhotos, response.body);
// // }

// // A function that converts a response body into a List<Photo>.
// List<Photo> parsePhotos(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
// }

// class Photo {
//   final int albumId;
//   final int id;
//   final String title;
//   final String url;
//   final String thumbnailUrl;

//   Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

//   factory Photo.fromJson(Map<String, dynamic> json) {
//     return Photo(
//       albumId: json['albumId'] as int,
//       id: json['id'] as int,
//       title: json['title'] as String,
//       url: json['url'] as String,
//       thumbnailUrl: json['thumbnailUrl'] as String,
//     );
//   }
// }


// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appTitle = 'Isolate Demo';

//     return MaterialApp(
//       title: appTitle,
//       home: MyHomePage(title: appTitle),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;

//   MyHomePage({Key key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: FutureBuilder<List<Photo>>(
//         //future: fetchPhotos(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) print(snapshot.error);

//           return snapshot.hasData
//               ? PhotosList(photos: snapshot.data)
//               : Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }

// class PhotosList extends StatelessWidget {
//   final List<Photo> photos;

//   PhotosList({Key key, this.photos}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemCount: photos.length,
//       itemBuilder: (context, index) {
//         return Image.network(photos[index].thumbnailUrl);
//       },
//     );
//   }
// }

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("assets/test.json"),),
      body: Center(
        child: FutureBuilder(builder: (context, snapshot){
          var showData=json.decode(snapshot.data.toString());
          return ListView.builder(
            
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(showData[index]['title']),
               subtitle: Text(showData[index]['thumbnailUrl']),
               onTap: () {
                 print("tappd");
               },
              );
            },
            itemCount: showData.length,
          );
        }, future: DefaultAssetBundle.of(context).loadString("assets/test.json"),
        
        ),
      ),
      
    );
  }
}