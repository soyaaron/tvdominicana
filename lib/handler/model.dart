class Canal {
  final int id;
  final String title;
  final String canal;
//final String imgURL;

  Canal({this.id, this.title, this.canal});

//Tutorial parsing
  factory Canal.fromJson(Map<String, dynamic> json) {
    return Canal(
      id: json['id'],
      title: json['title'],
      canal: json['canal'],
    );
  }
}
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

// Map canalMap = jsonDecode('assets/test.json');
// Map<String, dynamic> canal = jsonDecode("assets/test.json");
