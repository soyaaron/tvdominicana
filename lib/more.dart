import 'package:flutter/material.dart';
import 'package:share/share.dart';

class More extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoreState();
  }
}

class _MoreState extends State<More> {
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
                      Share.share("Compartir");
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
                        "Más",
                        textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Configuración"),
                leading: Icon(Icons.settings, color: Colors.grey),
                onTap: () {},
              ),
              ListTile(
                title: Text("Remover Anuncios", style: TextStyle(color: Color(0xff2B5CAB),fontWeight: FontWeight.w900),),
                leading: Icon(Icons.credit_card, color: Color(0xff2B5CAB)),
                onTap: () {},
              ),
              ListTile(
                title: Text("Calificar"),
                leading: Icon(Icons.rate_review, color: Colors.grey),
                onTap: () {},
              ),
              ListTile(
                title: Text("Compartir App"),
                leading: Icon(Icons.share, color: Colors.grey),
                onTap: () {
                  Share.share("Cosa");
                },
              ),

              ListTile(
                title: Text("Politicas de Privacidad"),
                leading: Icon(Icons.lock, color: Colors.grey),
                onTap: _showprivacy,
              ),

            ],
          ),
        ),
      ),
    );
  }
    void _showprivacy() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Politicas de Privacidad"),
          content: new Text(""),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
 
