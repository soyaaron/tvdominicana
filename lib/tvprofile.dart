import 'package:flutter/material.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:share/share.dart';
import 'package:email_launcher/email_launcher.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:tvdominicana/ad_manager.dart';

class TvProfile extends StatefulWidget {
  final Canal canal;
  TvProfile({Key key, @required this.canal}) : super(key: key);
  @override
  _TvProfile createState() => new _TvProfile(canal);
}

class _TvProfile extends State<TvProfile> {
  
//Caargar anuncios
BannerAd _bannerAd;

void _loadBannerAd(){
  _bannerAd
  ..load()
  ..show(anchorType:AnchorType.bottom);
}

  //Cargar infocanal
  Canal canal;
  _TvProfile(Canal canal) {
    this.canal = canal;
  }

  //Video
  FlickManager flickManager;
  @override
  void initState() {
//Caargar anuncios
    _bannerAd = BannerAd(adUnitId: AdManager.bannerAdUnitId,
    size: AdSize.mediumRectangle,
    );
    _loadBannerAd();
    
  //Video
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
            " está teniendo error de reproducción (En caso de tener un error diferente por favor especifique)");
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
                            Share.share("¡Estoy viendo " +
                                canal.title +
                                " en esta aplicación! Descargala aquí y disfruta: https://www.google.com/");
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

    _bannerAd?.dispose();

    flickManager.dispose();
    super.dispose();
  }
}
