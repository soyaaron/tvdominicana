import 'package:flutter/material.dart';
import 'package:test_drive/home.dart';
//import 'package:admob_flutter/admob_flutter.dart';
//import 'package:facebook_audience_network/facebook_audience_network.dart';

int fondo = 0xffFAF4F5;
Color blueColor = Color.fromARGB(255, 0, 82, 150); // Given blue color
int rojo = 0xffD8193A;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.system,
    theme: ThemeData(
      // Define your light mode theme here
      primarySwatch: MaterialColor(
        blueColor.value,
        <int, Color>{
          // Shades of blue
          50: Color.fromRGBO(0, 82, 150, 0.1), // Lightest shade
          100: Color.fromRGBO(0, 82, 150, 0.2),
          200: Color.fromRGBO(0, 82, 150, 0.3),
          300: Color.fromRGBO(0, 82, 150, 0.4),
          400: Color.fromRGBO(0, 82, 150, 0.5),
          500: blueColor, // Main shade
          600: Color.fromRGBO(0, 82, 150, 0.6),
          700: Color.fromRGBO(0, 82, 150, 0.7),
          800: Color.fromRGBO(0, 82, 150, 0.8),
          900: Color.fromRGBO(0, 82, 150, 0.9), // Darkest shade
        },
      ),
      scaffoldBackgroundColor:
          Color.fromARGB(255, 255, 242, 241), // Light mode background color
    ),
    darkTheme: ThemeData.dark().copyWith(
      // Define your dark mode theme here
      scaffoldBackgroundColor: Colors.black, // Dark mode background color
      // You can define other properties specific to dark mode here
    ),
    home: Scaffold(
      body: Homepage(),
    ),
  ));
}
