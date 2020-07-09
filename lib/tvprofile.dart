import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:video_player/video_player.dart';

class TvProfile extends StatefulWidget {
  final Canal canal;

  TvProfile({Key key, @required this.canal}) : super(key: key);
  @override
  _TvProfile createState() => new _TvProfile(canal);
}

class _TvProfile extends State<TvProfile> {
  Canal canal;
  _TvProfile(Canal canal) {
    this.canal = canal;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(canal.title)),
      body: Column(
        children: <Widget>[
          Image.network(canal.imgUrl),
        ],
      ),
    );
  }
}

// class TvProfile extends StatelessWidget {
//   final Canal canal;
//   TvProfile({Key key, this.canal}) : super(key: key);

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(canal.title)),
//       body: Column(
//       children: <Widget>[
//         Image.network(canal.imgUrl),
//         RaisedButton.icon(onPressed: (null),
//         icon: Icon(Icons.play_circle_outline),
//         label: Text('Reproducir'))
//       ],

//       ),
//     );
//   }
// }
