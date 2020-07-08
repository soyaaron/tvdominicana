import 'package:flutter/material.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:video_player/video_player.dart';

class TvProfile extends StatefulWidget {
  final Canal canal;

   // TvProfile(this.canales);
@override
 TvProfile({Key key, this.canal}) : super(key: key);
  _TvProfile createState() => new _TvProfile();
}

class _TvProfile extends State<TvProfile> {
  Canal canal;

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
