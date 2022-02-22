import 'package:flutter/material.dart';
import 'package:myfoodz/Screens/Add.dart';
import 'package:myfoodz/Screens/Chart.dart';
import 'package:myfoodz/Screens/Home.dart';
import 'package:myfoodz/Screens/SplashScreen.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';

void main() async{
  //initialise firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //create the database for the user
  //read data from the database 
  //add data in the database
  //delete data in the database

  runApp(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context)=>SplashScreen(),
          '/Home': (context)=> HomePage(),
          '/Chart': (context)=> ChartPage(),
          '/Add': (context)=> AddPage(),
      }));
}

