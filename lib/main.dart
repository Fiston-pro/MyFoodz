import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Screens
import 'package:myfoodz/Screens/Add.dart';
import 'package:myfoodz/Screens/Chart.dart';
import 'package:myfoodz/Screens/Home.dart';
import 'package:myfoodz/Screens/SplashScreen.dart';
//firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myfoodz/Screens/signin.dart';
import 'package:myfoodz/modal.dart';
import 'package:myfoodz/service.dart';

void main() async{
  //initialise firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //first check if the user is logged in and go ahead to the app

      // User is signed in
      //get data from firebase
      //var user_data = DatabaseService().get_data(user!.uid);
      //provide data to widgets
      //use statenotifier to pass the object down the tree
      runApp(ProviderScope(
        child: MaterialApp(
              initialRoute: '/Home',
              routes: {
                '/': (context)=> SplashScreen(),
                '/Home': (context)=> HomePage(),
                '/Chart': (context)=> ChartPage(),
                '/Add': (context)=> AddPage(),
            }),
      ));
    
}

