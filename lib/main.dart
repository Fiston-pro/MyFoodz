import 'package:flutter/material.dart';
import 'package:myfoodz/Screens/Add.dart';
import 'package:myfoodz/Screens/Chart.dart';
import 'package:myfoodz/Screens/Home.dart';
import 'package:myfoodz/Screens/SplashScreen.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  //initialise firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //initialise firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //create the database for the user
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> adduser (){
    return users.add({
      "name":"Fiston",
      "birthdate": "2022-05-28"
    }).then((value) => print("User added")).catchError((error)=>print(error));
  }
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

