import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:share/share.dart';
import 'package:email_launcher/email_launcher.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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

// diferenciar entre iframe, native 
  Widget playerCase() {
    if (canal.iframe == true) {
      return
          HtmlWidget(
            canal.streamUrl,
            webView: true,      );
      
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
                    width: 330,
                    height: 70,
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
                                    " en esta aplicación! Descárgala aquí y disfruta este y más: https://play.google.com/store/apps/details?id=com.aarondev.tvdominicana");
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
                              onPressed: _mailconfirm,
                              icon: Icon(Icons.bug_report),
                              tooltip: "Reportar",
                            ),
                            Text("Reportar Canal")
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            AdmobBanner(
              adUnitId: getBannerId(),
              adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
            ),
          ])
        ],
      ),
    );
    // Mail
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
                onPressed: _launchEmail,
                child: new Text("Continuar"),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  String getBannerId() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3684382582844010/7891071574";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4339318960";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
