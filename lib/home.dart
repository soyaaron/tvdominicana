import 'dart:io';
import 'package:test_drive/tvprofile.dart';
import 'package:test_drive/search.dart';
import 'package:test_drive/more.dart';
import 'package:test_drive/handler/model.dart';
import 'package:test_drive/handler/service.dart';
//import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Homepage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeContent(),
    More(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          new Expanded(child: _children[_currentIndex]),
          // AdmobBanner(
          //   adUnitId: getBannerAdUnitId(),
          //   adSize: AdmobBannerSize.ADAPTIVE_BANNER(width: 375),
          // ),
/*           FacebookBannerAd(
            placementId: "350102749475351_350103932808566",
            bannerSize: BannerSize.STANDARD,
          ), */
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            label: "Home",
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "Más",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  // String getBannerAdUnitId() {
  //   if (Platform.isAndroid) {
  //     // return "ca-app-pub-3684382582844010/2981950703";

  //     //test
  //     return "ca-app-pub-3940256099942544/6300978111";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/4339318960";
  //   }
  //   return null;
  // }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: const Color.fromARGB(255, 0, 82, 150),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45)),
              ),
              expandedHeight: 90,
              floating: false,
              pinned: false,
              actions: <Widget>[
                IconButton(
                    iconSize: 27,
                    padding: EdgeInsets.only(right: 15, top: 25.25),
                    icon: Icon(Icons.share),
                    color: Colors.white,
                    onPressed: () {
                      Share.share(
                          "¡Descarga Televisión Dominicana y disfruta de muchos canales en la mejor calidad! Descárgala yá en este enlace: https://play.google.com/store/apps/details?id=com.aarondev.test_drive");
                    }),
              ],
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 15, bottom: 25.25),
                title: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Televisión Dominicana",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        //generar y cargar lista
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: FutureBuilder<List<Canal>>(
            future: fetchCanal(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? CanalList(
                      canales: snapshot.data!,
                    )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        icon: Icon(Icons.search),
//        label: Text("Buscar"),
//        onPressed: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (context) => BuscarCanal(),
//            ),
//          );
//        },
//      ),
    );
  }
}

class CanalList extends StatelessWidget {
  final List<Canal> canales;
  CanalList({Key? key, required this.canales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: canales.length,
      separatorBuilder: (BuildContext context, int index) {
        if (index % 11 == 8) {}
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            canales[index].title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
          ),
          subtitle: Text(
            "Canal: " + canales[index].canal,
            style: TextStyle(fontSize: 14),
          ),
          leading: Image.network(canales[index].imgUrl),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TvProfile(canal: canales[index]),
              ),
            );
          },
        );
      },
    );
  }
}
