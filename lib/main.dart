import 'package:flutter/material.dart';
import 'package:tvdominicana/home.dart';
import 'package:tvdominicana/home.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Home(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text('Contribute'),
          ),
        ],
      ),
    ),
  ));
}