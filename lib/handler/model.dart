class Canal {
  final int id;
  final String title;
  final String canal;
  final String imgUrl;
  final String streamUrl;
  final bool iframe;
  final int streamType;

  Canal({
    this.id = 0,
    this.title = '',
    this.canal = '',
    this.imgUrl = '',
    this.streamUrl = '',
    this.iframe = false,
    this.streamType = 0,
  });

  // Tutorial parsing
  factory Canal.fromJson(Map<String, dynamic> json) {
    return Canal(
      id: json['id'] != null ? json['id'] as int : 0,
      title: json['title'] != null ? json['title'] as String : '',
      canal: json['canal'] != null ? json['canal'] as String : '',
      imgUrl: json['imgURL'] != null ? json['imgURL'] as String : '',
      streamUrl: json['streamURL'] != null ? json['streamURL'] as String : '',
      iframe: json['iframe'] != null ? json['iframe'] as bool : false,
      streamType: json['streamType'] != null ? json['streamType'] as int : 0,
    );
  }


  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'canal': canal,
        'imgURL': imgUrl,
        'streamURL': streamUrl,
        'iframe': iframe,
        'streamType': streamType,
      };
}
