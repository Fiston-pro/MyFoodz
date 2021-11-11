import 'dart:js';

import 'package:flutter/material.dart';
import 'package:myfoodz/Screens/Add.dart';
import 'package:myfoodz/Screens/Chart.dart';
import 'package:myfoodz/Screens/Home.dart';
import 'package:myfoodz/Screens/SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context)=>SplashScreen(),
      '/Home': (context)=> HomePage(),
      '/Chart': (context)=> ChartPage(),
      '/Add': (context)=> AddPage(),
  },
  ));
}

