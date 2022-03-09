//firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_login/flutter_login.dart'; //Login page package
import 'package:myfoodz/modal.dart';
import 'package:myfoodz/providers.dart';// modal for user data

//Firestore database class
class DatabaseService {
  
  //initialise firestore
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getData (String id) async{
    var snap = await _db.collection("users").doc(id).get();
    return snap.data();
  }

}

// FireBase Auth class
class AuthService {

    Future<String?> authUser(LoginData data) async {
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data.name,
        password: data.password
       ) ;
      return null;
    } on FirebaseAuthException catch (e) {
      var message = "";
      switch (e.code){
        case "invalid-email":
        message = "The email you entered is invalid";
        break;
        case "user-disabled":
        message = "The user you tried to log into is disabled";
        break;
        case "user-not-found":
        message = "The user you tried to log into was not found";
        break;
        case "wrong password":
        message = "Wrong password";
        break;
      }
      return message;
    }
  }
  Future<String?> signupUser(SignupData data) async {
    //debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data.name.toString(),
        password: data.password.toString()
      );
      //verify the email
      User? user = FirebaseAuth.instance.currentUser;
      if (user!= null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      //Initialise data in firebase
      post_data_to_firestore(data);
      // go back to login page
      return null;
    } on FirebaseAuthException catch (e) {
      var message = "";
      switch (e.code){
        case "weak-password":
        message = "The password provided is too weak.";
        break;
        case "email-already-in-use":
        message = "The account already exists for that email.";
        break;
      }
      return message;
    }
  }
  Future<String?> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return "null";      
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
}

    // post data to firestore
  post_data_to_firestore(data) async {
    User? userInfo = FirebaseAuth.instance.currentUser;
    //populate user object
    UserData user =UserData(name: data.name, birthdate: "", foods: {}, history: {}, email: userInfo?.email, uid: userInfo!.uid);
    //post data to firestore
    await FirebaseFirestore.instance.collection("users").doc(userInfo.uid).set(
      {"name": "",
      "email": userInfo.email,
      "uid": userInfo.uid,
      "birthdate": "",
      "foods": {},
      "history": {}});
  }
}