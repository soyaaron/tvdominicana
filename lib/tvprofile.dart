import 'package:flutter/material.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:share/share.dart';
import 'package:email_launcher/email_launcher.dart';

class TvProfile extends StatefulWidget {
  final Canal canal;
  var mail = 'mailto:smith@example.org?subject=News&body=New%20plugin';
  TvProfile({Key key, @required this.canal}) : super(key: key);
  @override
  _TvProfile createState() => new _TvProfile(canal);
}

class _TvProfile extends State<TvProfile> {
  //Cargar infocanal
  Canal canal;
  _TvProfile(Canal canal) {
    this.canal = canal;
  }

  //Video
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(canal.streamUrl),
    );
  }

  //mail
  void _launchEmail() async {
    Email email = Email(
        to: ['aarondev98@gmail.com'],
        subject: "El canal " + canal.title + " está teniendo errores",
        body: "El canal " +
            canal.canal +
            " esta teniendo error de reproducción (En caso de tener un error diferente especifique por favor)");
    await EmailLauncher.launch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(canal.title)),
      body: Column(
        children: <Widget>[
          Container(child: FlickVideoPlayer(flickManager: flickManager)),
          //Botones de informacion
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                width: 350,
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 0))
                    ],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5.75))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Share.share("Estoy viendo " +
                                canal.title +
                                " en esta app: LINK");
                          },
                          icon: Icon(Icons.share),
                          tooltip: "Compartir",
                        ),
                        Text("Compartir")
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: _launchEmail,
                          icon: Icon(Icons.bug_report),
                          tooltip: "Reportar",
                        ),
                        Text("Reportar Canal")
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
    // Mail
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
}
