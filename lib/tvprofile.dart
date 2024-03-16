// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:test_drive/handler/model.dart';
// import 'package:video_player/video_player.dart';
// // import 'package:flick_video_player/flick_video_player.dart';
// import 'package:share/share.dart';
// // import 'package:admob_flutter/admob_flutter.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:chewie/chewie.dart';
// import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
//
// class TvProfile extends StatefulWidget {
//   final Canal canal;
//   TvProfile({Key? key, required this.canal}) : super(key: key);
//   @override
//   _TvProfile createState() => new _TvProfile(canal);
// }
//
// class _TvProfile extends State<TvProfile> {
//   Canal canal;
//   VideoPlayerController _videoPlayerController;
//   ChewieController _chewieController;
//
//   _TvProfile(Canal canal)
//       : canal = canal,
//         _videoPlayerController = VideoPlayerController.network(canal.streamUrl),
//         _chewieController = ChewieController(
//           videoPlayerController: VideoPlayerController.network(canal.streamUrl),
//           aspectRatio: 16 / 9,
//           allowedScreenSleep: false,
//           allowMuting: false,
//           isLive: true,
//           fullScreenByDefault: true,
//           showControlsOnInitialize: false,
//           autoInitialize: true,
//           allowFullScreen: true,
//           placeholder:
//               Container(decoration: BoxDecoration(color: Colors.black87)),
//         ) {
//     // Additional constructor logic if needed
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     //Video
//     super.initState();
//     // flickManager = FlickManager(
//     //   videoPlayerController: VideoPlayerController.network(canal.streamUrl),
//     // );
//     _videoPlayerController = VideoPlayerController.network(canal.streamUrl);
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       aspectRatio: 16 / 9,
//       allowedScreenSleep: false,
//       allowMuting: false,
//       isLive: true,
//       fullScreenByDefault: true,
//       showControlsOnInitialize: false,
//       autoInitialize: true,
//       allowFullScreen: true,
//       placeholder: Container(decoration: BoxDecoration(color: Colors.black87)),
//     );
//   }
//
// // diferenciar entre iframe, native
//   Widget playerCase() {
//     var caso = canal.streamType;
//     switch (caso) {
//       case 1:
//         {
//           return HtmlWidget(
//             canal.streamUrl,
//             //webView: true,
//           );
//         }
//         break;
//       case 2:
//         {
//           return HtmlWidget(
//             canal.streamUrl,
//             //webView: true,
//           );
//         }
//         break;
//
//       case 3:
//         {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Container(
//                     width: 380,
//                     height: 200,
//                     decoration: BoxDecoration(
//                         color: Colors.black87,
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 1,
//                               blurRadius: 2,
//                               offset: Offset(0, 0))
//                         ],
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.all(Radius.circular(5.75))),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Column(
//                             children: <Widget>[
//                               Icon(
//                                 Icons.info_outline_rounded,
//                                 color: Colors.blueGrey[200],
//                                 size: 35,
//                               ),
//                               Text(
//                                   "Por el momento este canal no se puede reproducir desde el app, click en el boton para ver desde su pagina web",
//                                   style:
//                                       TextStyle(color: Colors.blueGrey[200])),
//                             ],
//                           ),
//                         ),
//                         MaterialButton(
//                           onPressed: () {
//                             print("thing");
//                           },
//                           color: Colors.white,
//                           child: Text("Visitar Pagina"),
//                           minWidth: 100,
//                         )
//                       ],
//                     )),
//               ),
//             ],
//           );
//         }
//         break;
//
//       default:
//         {
//           return Container(
//             height: 200, // Set a specific height for the container
//             child: Chewie(
//               controller: _chewieController,
//             ),
//           );
//         }
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(canal.title)),
//       body: Wrap(
//         children: <Widget>[
//           playerCase(),
//
//           //Botones de informacion
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Container(
//                     width: 325,
//                     height: 85,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 1,
//                               blurRadius: 2,
//                               offset: Offset(0, 0))
//                         ],
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.all(Radius.circular(5.75))),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                         TextButton(
//                           onPressed: compartir,
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Column(
//                               children: <Widget>[
//                                 Icon(Icons.share),
//                                 Text("Compartir")
//                               ],
//                             ),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: _mailconfirm,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: <Widget>[
//                                 Icon(Icons.bug_report),
//                                 Text("Reportar Canal")
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//             ],
//           ),
//           //  Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//           //   AdmobBanner(
//           //     adUnitId: getBannerAdUnitId(),
//           //     adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
//           //   ),
//
// /*           FacebookBannerAd(
//             placementId: Platform.isAndroid
//                 ? "350102749475351_369888480830111"
//                 : "YOUR_IOS_PLACEMENT_ID",
//             bannerSize: BannerSize.MEDIUM_RECTANGLE,
//           ),
//            */
//           //    ])
//         ],
//       ),
//     );
//     // Mail
//   }
//
// //compartir
//   void compartir() {
//     Share.share("¡Estoy viendo " +
//         canal.title +
//         " en este app! Descárgala aquí y disfruta este y más: https://play.google.com/store/apps/details?id=com.aarondev.tvdominicana");
//   }
//
// //confirmacion correo
//   void _mailconfirm() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           child: AlertDialog(
//             shape: ContinuousRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(45))),
//             title: new Text("Reportar Fallo en Canal"),
//             content: SingleChildScrollView(
//               child: new Text(
//                   "Se abrirá su aplicación de correos para enviar el reporte. ¿Desea continuar?"),
//             ),
//             actions: <Widget>[
//               new TextButton(
//                 child: new Text("Cerrar"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               new TextButton(
//                 // onPressed: _launchEmail,
//                 onPressed: _launchMail,
//                 child: new Text("Continuar"),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _launchMail() async {
//     final Uri mail =
//         Uri(scheme: 'mailto', path: 'aarondev98@gmail.com', queryParameters: {
//       'subject': canal.title + ' tiene errores',
//       'body':
//           'El canal está teniendo error de reproducción (Si es diferente especifique)'
//     });
//     String url = mail.toString();
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       print('Could not launch $url');
//     }
//   }
//
// // String getBannerAdUnitId() {
// //   if (Platform.isAndroid) {
// //     // adunit
// //     // return "ca-app-pub-3684382582844010/7891071574";
// //     // test
// //     return "ca-app-pub-3940256099942544/6300978111";
// //   } else if (Platform.isIOS) {
// //     return "ca-app-pub-3940256099942544/4339318960";
// //   } else {
// //     throw new UnsupportedError("Unsupported platform");
// //   }
// // }
// }
//

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_drive/handler/model.dart';
import 'package:video_player/video_player.dart';
// import 'package:flick_video_player/flick_video_player.dart';
import 'package:share/share.dart';
// import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chewie/chewie.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system // Automatic theme mode
      ));
}

class TvProfile extends StatefulWidget {
  final Canal canal;
  TvProfile({Key? key, required this.canal}) : super(key: key);

  @override
  _TvProfile createState() => new _TvProfile(canal);
}

class _TvProfile extends State<TvProfile> {
  Canal canal;
  _TvProfile(Canal canal) : canal = canal;

  bool fullscreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullscreen == false
          ? AppBar(
              title: Text(canal.title),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          : null,
      body: Padding(
        padding:
            fullscreen ? EdgeInsets.zero : const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            YoYoPlayer(
              aspectRatio: 16 / 9,
              url: canal.streamUrl,
              allowCacheFile: true,
              autoPlayVideoAfterInit: false,
              onCacheFileCompleted: (files) {
                print('Cached file length ::: ${files?.length}');
                if (files != null && files.isNotEmpty) {
                  for (var file in files) {
                    print('File path ::: ${file.path}');
                  }
                }
              },
              onCacheFileFailed: (error) {
                print('Cache file error ::: $error');
              },
              videoStyle: const VideoStyle(
                allowScrubbing: false,
                showLiveDirectButton: true,
                playButtonIconSize: 40.0,
                playIcon: Icon(
                  Icons.play_arrow,
                  size: 40.0,
                  color: Colors.white,
                ),
                pauseIcon: Icon(
                  Icons.pause,
                  size: 40.0,
                  color: Colors.white,
                ),
                videoQualityPadding: EdgeInsets.all(5.0),
              ),
              onFullScreen: (value) {
                setState(() {
                  if (fullscreen != value) {
                    fullscreen = value;
                  }
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: 325,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .cardColor, // Use the card color from the theme
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 0),
                        )
                      ],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(5.75)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            compartir();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.share),
                                Text("Compartir"),
                              ],
                            ),
                          ),
                        ),
//                        TextButton(
//                          onPressed: () {
//                            _mailconfirm();
//                          },
//                          child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Column(
//                              children: <Widget>[
//                                Icon(Icons.bug_report),
//                                Text("Reportar Canal"),
//                              ],
//                            ),
//                          ),
//                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
              new TextButton(
                child: new Text("Cerrar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
//              new TextButton(
//                // onPressed: _launchEmail,
//                onPressed: _launchMail,
//                child: new Text("Continuar"),
//              )
            ],
          ),
        );
      },
    );
  }

  void _launchMail() async {
    final Uri mail =
        Uri(scheme: 'mailto', path: 'aarondev98@gmail.com', queryParameters: {
      'subject': canal.title + ' tiene errores',
      'body':
          'El canal está teniendo error de reproducción (Si es diferente especifique)'
    });
    String url = mail.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
