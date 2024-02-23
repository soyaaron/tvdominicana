import 'dart:io';

//import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/handler/model.dart';
import 'package:test_drive/handler/service.dart';
import 'package:test_drive/tvprofile.dart';
import 'package:http/http.dart' as http;
//import 'package:facebook_audience_network/facebook_audience_network.dart';

class BuscarCanal extends StatefulWidget {
  @override
  _BuscarCanal createState() => new _BuscarCanal();
}

class _BuscarCanal extends State<BuscarCanal> {
  List<Canal> canales = List<Canal>.empty();
  List<Canal> resultBusqueda = List<Canal>.empty();

  @override
  void initState() {
    fetchCanal(http.Client()).then((value) {
      setState(() {
        canales.addAll(value);
        resultBusqueda = canales;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45)),
        ),
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 60, bottom: 18),
          title: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Búsqueda",
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
/*           FacebookBannerAd(
            placementId: "350102749475351_370038980815061",
            bannerSize: BannerSize.STANDARD,
          ), */
          new Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return index == 0 ? barraBusqueda() : listaItem(index - 1);
              },
              itemCount: resultBusqueda.length + 1,
            ),
          ),
        ],
      ),
    );
  }

  // String getBannerAdUnitId() {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3684382582844010/8461508091";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/4339318960";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }

  barraBusqueda() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        width: 350,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1.5,
                  offset: Offset(0, 1))
            ],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(5.75))),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              hintText: "Buscar..."),
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {
              resultBusqueda = canales.where((canal) {
                var nombrecanal = canal.title.toLowerCase();

                return nombrecanal.contains(text);
              }).toList();
            });
          },
        ),
      ),
    );
  }

  listaItem(index) {
    return ListTile(
      title: Text(
        resultBusqueda[index].title,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
      ),
      subtitle: Text(
        "Canal: " + resultBusqueda[index].canal,
        style: TextStyle(fontSize: 14),
      ),
      leading: Image.network(resultBusqueda[index].imgUrl),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TvProfile(canal: resultBusqueda[index]),
          ),
        );
      },
    );
  }
}
