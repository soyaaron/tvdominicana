import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:share/share.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';


class TvProfile extends StatefulWidget {
  final Canal canal;
  TvProfile({Key key, @required this.canal}) : super(key: key);
  @override
  _TvProfile createState() => new _TvProfile(canal);
}

class _TvProfile extends State<TvProfile> {
  Canal canal;
  FlickManager flickManager;

  //Cargar infocanal

  _TvProfile(Canal canal) {
    this.canal = canal;
  }

  @override
  void initState() {
    //Video
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(canal.streamUrl),
    );
  }

// diferenciar entre iframe, native
  Widget playerCase() {
    if (canal.iframe == true) {
      return HtmlWidget(
        canal.streamUrl,
        webView: true,
      );
    } else {
      return FlickVideoPlayer(flickManager: flickManager);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(canal.title)),
      body: Wrap(
        children: <Widget>[
          playerCase(),

          //Botones de informacion
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                    width: 325,
                    height: 61,
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
                        FlatButton(
                          onPressed: compartir,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.share),
                                Text("Compartir")
                              ],
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: _mailconfirm,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.bug_report),
                                Text("Reportar Canal")
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            AdmobBanner(
              adUnitId: getBannerAdUnitId(),
              adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
            ),
          ])
        ],
      ),
    );
    // Mail
  }

//compartir
  void compartir() {
    Share.share("¡Estoy viendo " +
        canal.title +
        " en este app! Descárgala aquí y disfruta este y más: https://play.google.com/store/apps/details?id=com.aarondev.tvdominicana");
  }

//confirmacion correo
  void _mailconfirm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(45))),
            title: new Text("Reportar Fallo en Canal"),
            content: SingleChildScrollView(
              child: new Text(
                  "Se abrirá su aplicación de correos para enviar el reporte. ¿Desea continuar?"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Cerrar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                // onPressed: _launchEmail,
                 onPressed: _launchMail,
                child: new Text("Continuar"),
              )
            ],
          ),
        );
      },
    );
  }

void _launchMail() async {

 final Uri mail = Uri(
   scheme: 'mailto',
   path: 'aarondev98@gmail.com',
   queryParameters: {
     'subject': 'El canal ' + canal.title + ' está teniendo errores',
     'body':  'El canal está teniendo error de reproducción (Si es diferente especifique)'
   }
);
String url = mail.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
}

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  String getBannerAdUnitId() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3684382582844010/7891071574";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4339318960";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
