import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Map<String, dynamic> canal = jsonDecode("assets/test.json");

class Canal {
final int   id;
final String title;
final String canal;
//final String imgURL;
 
Canal({this.id, this.title, this.canal});



//Turorial serialization
//  Canal.fromJson(Map<String, dynamic>json)
// : id =json['id'],
// title=json['title'],
// canal=json['canal'];
// //imgURL=json['imgURL'];
  
// Map<String,dynamic>toJson()=>
// {
//   'id':id,
//   'title':title,
//   'canal': canal,
// };

//Tutorial parsing
factory Canal.fromJson(Map<String, dynamic> json){
  return Canal(
    id: json['id'] as int,
    title: json['title'] as String,
    canal: json['canal'] as String,


  );
}

  

}


//Map canalMap = jsonDecode('assets/test.json');

