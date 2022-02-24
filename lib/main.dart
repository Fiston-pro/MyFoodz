import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfoodz/Screens/Add.dart';
import 'package:myfoodz/Screens/Chart.dart';
import 'package:myfoodz/Screens/Home.dart';
import 'package:myfoodz/Screens/SplashScreen.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:myfoodz/Screens/signin.dart';

void main() async{
  //initialise firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //first check if the user is logged in and go ahead to the app
  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      //User is signed out
      LoginScreen();
    } else {
      // User is signed in
      //get data from firebase
      //provide data to widgets
      runApp(MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context)=> SplashScreen(),
              '/Home': (context)=> HomePage(),
              '/Chart': (context)=> ChartPage(),
              '/Add': (context)=> AddPage(),
          }));
    }
  });

}

