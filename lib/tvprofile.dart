import 'package:flutter/material.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

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
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(canal.streamUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(canal.title)),
      body: Column(
        children: <Widget>[
          Image.network(canal.imgUrl),
          Container(
            child: FlickVideoPlayer(flickManager: flickManager)
          ),

        ],
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
}
