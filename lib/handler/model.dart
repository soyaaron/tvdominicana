class Canal {
  final int id;
  final String title;
  final String canal;
  final String imgUrl;
  final String streamUrl;

  Canal({this.id, this.title, this.canal, this.imgUrl, this.streamUrl});

//Tutorial parsing
  factory Canal.fromJson(Map<String, dynamic> json) {
    return Canal(
      id: json['id'] as int,
      title: json['title'] as String,
      canal: json['canal'] as String,
      imgUrl: json['imgURL'] as String,
      streamUrl: json['streamURL'] as String
    );
  }
}