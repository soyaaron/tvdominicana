// // import 'dart:convert';

// class Canal {
//   int canalid;
//   String title;
//   String canal;
//   String imgUrl;
//   int id;

//   Canal({
//     this.canalid,
//     this.title,
//     this.canal,
//     this.imgUrl,
//     this.id,
//   });

//   factory Canal.fromJson(Map<String, dynamic> json) => Canal(
//         canalid: json["canalid"],
//         title: json["title"],
//         canal: json["canal"],
//         imgUrl: json["imgURL"],
//         id: json["id"] == null ? null : json["id"],
//       );


// }

// To parse this JSON data, do
import 'dart:convert';

   final dataCanal = dataCanalFromJson('assets/test.json');


List<DataCanal> dataCanalFromJson(String str) => List<DataCanal>.from(json.decode(str).map((x) => DataCanal.fromJson(x)));
String dataCanalToJson(List<DataCanal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class DataCanal {

    DataCanal({
        this.title,
        this.canal,
        this.imgUrl,
        this.id,
    });

    int id;
    String title;
    String canal;
    String imgUrl;

    factory DataCanal.fromJson(Map<String, dynamic> json) => DataCanal(
        title: json["title"],
        canal: json["canal"],
        imgUrl: json["imgURL"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "canal": canal,
        "imgURL": imgUrl,
        "id": id == null ? null : id,
    };
}



  DataCanal fetchByID(int canalID){
    
  List<DataCanal> canales = DataCanal.fromJson(json);
  for (var i=0; i< canales.length; i++){
    if (canales[i].id == canalID){
      return canales[i];
    }
    return null;
  }
}