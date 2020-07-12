import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tvdominicana/tvprofile.dart';
import 'package:tvdominicana/search.dart';
import 'package:tvdominicana/favorites.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:tvdominicana/handler/service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:tvdominicana/handler/saved_favorites.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteState();
  }
}

class _FavoriteState extends State<Favorites> {
  SavedFav savedFav = SavedFav();
  Canal canalLoad = Canal();

  loadSharedPrefs() async {
    try {
      Canal canal = Canal.fromJson(await savedFav.read("canal"));
      Scaffold.of(context).showSnackBar(SnackBar(
          content: new Text("Loaded!"),
          duration: const Duration(milliseconds: 500)));
      setState(() {
        canalLoad = canal;
      });
    } catch (Excepetion) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: new Text("Nothing found!"),
          duration: const Duration(milliseconds: 500)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45)),
              ),
              expandedHeight: 125,
              floating: false,
              pinned: false,
              actions: <Widget>[
                IconButton(
                    iconSize: 27,
                    padding: EdgeInsets.only(right: 15, top: 31.25),
                    icon: Icon(Icons.share),
                    onPressed: () {
                      Share.share("Descargame");
                    }),
              ],
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 15, bottom: 50),
                title: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Favoritos",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.search),
        label: Text("Buscar"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuscarCanal(),
            ),
          );
        },
      ),
    );
  }

  listaItem(index) {
    return ListTile(
      title: Text(
        canalLoad.title ?? '',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
      ),
      subtitle: Text(
        "Canal: " + canalLoad.canal ?? "",
        style: TextStyle(fontSize: 14),
      ),
      leading: Image.network(canalLoad.imgUrl ?? ''),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TvProfile(canal: canalLoad),
          ),
        );
      },
    );
  }
}
