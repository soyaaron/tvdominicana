import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tvdominicana/home.dart';
import 'package:admob_flutter/admob_flutter.dart';


int azul =  0xff2B5CAB;
int rojo = 0xffD8193A;
int fondo = 0xffFAF4F5;

void main() {
    Admob.initialize(getAppId());

  runApp(MaterialApp(
     debugShowCheckedModeBanner: false, 
      theme: ThemeData(
    // Define the default brightness and colors.
   // brightness: Brightness.light,
    primaryColor: Color(azul),
    accentColor: Color(azul),
    scaffoldBackgroundColor: Color(fondo)

    ),
    home: Scaffold(
      body: Homepage(),
    ),
  ));

}
