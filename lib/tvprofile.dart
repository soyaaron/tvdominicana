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
// class TvProfile extends StatefulWidget {
//   final Canal canal;

//   TvProfile({Key key, @required this.canal}) : super(key: key);
//   @override
//   _TvProfile createState() => new _TvProfile(canal);
// }

// class _TvProfile extends State<TvProfile> {
//   Canal canal;
//   _TvProfile(Canal canal) {
//     this.canal = canal;
//   }
//   VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         canal.streamUrl)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(canal.title)),
//       body: Column(
//         children: <Widget>[
//           Image.network(canal.imgUrl),
//           Container(
//             child: _controller.value.initialized
//                 ? AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: VideoPlayer(_controller),
//                   )
//                 : Container(),
//           ),
//           FloatingActionButton(onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),)
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }

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
