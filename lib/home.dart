import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tvdominicana/tvprofile.dart';
import 'package:tvdominicana/search.dart';
import 'package:tvdominicana/favorites.dart';
import 'package:tvdominicana/more.dart';
import 'package:tvdominicana/handler/model.dart';
import 'package:tvdominicana/handler/service.dart';
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
    Favorites(),
    More(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            title: Text("Home"),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favoritos"),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text("Más"),
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
}

class HomeContent extends StatelessWidget {
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
                titlePadding: EdgeInsets.only(left: 15, bottom: 31.25),
                title: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Television",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Dominicana",
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top:20),
          child: FutureBuilder<List<Canal>>(
              future: fetchCanal(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? CanalList(
                        canales: snapshot.data,
                      )
                    : Center(child: CircularProgressIndicator());
              }),
        ),
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

class CanalList extends StatelessWidget {
  final List<Canal> canales;
  CanalList({Key key, @required this.canales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: canales.length,
      itemBuilder: (context, index) {
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

