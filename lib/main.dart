
import 'package:flutter/material.dart';
import 'package:tvdominicana/home.dart';
//import 'package:admob_flutter/admob_flutter.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

int fondo = 0xffFAF4F5;
int azul =  0xff2B5CAB;
int rojo = 0xffD8193A;

void main() {
 //   Admob.initialize();
  // Admob.initialize(testDeviceIds: ['ca-app-pub-3940256099942544~4354546703']);
FacebookAudienceNetwork.init(
  // testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
);
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

