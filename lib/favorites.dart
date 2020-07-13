import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tvdominicana/search.dart';


class Favorites extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteState();
  }
}

class _FavoriteState extends State<Favorites> {



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


}
