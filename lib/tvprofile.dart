import 'package:flutter/material.dart';
import 'package:tvdominicana/handler/model.dart';



class TvProfile extends StatelessWidget {
  final Canal canal;
  TvProfile({Key key, this.canal}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(canal.title)),
      body: Container(
      child: Image.network(canal.imgUrl),

      ),
    );
  }
}
