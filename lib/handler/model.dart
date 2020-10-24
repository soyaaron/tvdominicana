class Canal {
  final int id;
  final String title;
  final String canal;
  final String imgUrl;
  final String streamUrl;
  final bool iframe;
  final int streamType;
  Canal({this.id, this.title, this.canal, this.imgUrl, this.streamUrl,this.iframe, this.streamType});

//Tutorial parsing
  factory Canal.fromJson(Map<String, dynamic> json) {
    return Canal(
      id: json['id'] as int,
      title: json['title'] as String,
      canal: json['canal'] as String,
      imgUrl: json['imgURL'] as String,
      streamUrl: json['streamURL'] as String,
      iframe: json['iframe']as bool,
      streamType: json['streamType'] as int,
    );
  }

  
  Map<String, dynamic>tojson()=>{
    'id':id,
    'title':title,
    'canal':canal,
    'imgURL':imgUrl,
    'streamURL':streamUrl,
    'iframe':iframe,
    'streamType':streamType,
  };



}
