// import 'dart:convert';

class Canal {
  int canalid;
  String title;
  String canal;
  String imgUrl;
  int id;

  Canal({
    this.canalid,
    this.title,
    this.canal,
    this.imgUrl,
    this.id,
  });

  factory Canal.fromJson(Map<String, dynamic> json) => Canal(
        canalid: json["canalid"],
        title: json["title"],
        canal: json["canal"],
        imgUrl: json["imgURL"],
        id: json["id"] == null ? null : json["id"],
      );


}





// To parse this JSON data, do
//

// final dataCanal = dataCanalFromJson('assets/test.json');

// List<DataCanal> dataCanalFromJson(String str) =>
//     List<DataCanal>.from(json.decode(str).map((x) => DataCanal.fromJson(x)));

// String dataCanalToJson(List<DataCanal> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class DataCanal {
//   DataCanal({
//     this.canalid,
//     this.title,
//     this.canal,
//     this.imgUrl,
//     this.id,
//   });

//   int canalid;
//   String title;
//   String canal;
//   String imgUrl;
//   int id;

//   factory DataCanal.fromJson(Map<String, dynamic> json) => DataCanal(
//         canalid: json["canalid"],
//         title: json["title"],
//         canal: json["canal"],
//         imgUrl: json["imgURL"],
//         id: json["id"] == null ? null : json["id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "canalid": canalid,
//         "title": title,
//         "canal": canal,
//         "imgURL": imgUrl,
//         "id": id == null ? null : id,
//       };
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// final datacanal  =
// class DataCanal {
//   int canalid;
//   String title;
//   String subtitulo;
//   String canal;
//   String imgURL;

//   DataCanal(
//       {this.canalid, this.title, this.subtitulo, this.canal, this.imgURL});

//   DataCanal.fromJson(Map<String, dynamic> json) {
//     canalid = json['canalid'];
//     title = json['title'];
//     subtitulo = json['subtitulo'];
//     canal = json['canal'];
//     imgURL = json['imgURL'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['canalid'] = this.canalid;
//   //   data['title'] = this.title;
//   //   data['subtitulo'] = this.subtitulo;
//   //   data['canal'] = this.canal;
//   //   data['imgURL'] = this.imgURL;
//   //   return data;
//   // }
// }
