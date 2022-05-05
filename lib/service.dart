//firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_login/flutter_login.dart'; //Login page package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoodz/providers.dart';// modal for user data

//Firestore database class
final databaseProvider = Provider<DatabaseService>((ref) {return DatabaseService(ref);});
class DatabaseService {

  DatabaseService(this.ref);

  final Ref ref;

  final FirebaseFirestore _db = FirebaseFirestore.instance;  //initialise firestore
  User? userInfo = FirebaseAuth.instance.currentUser; //get the authorized user

  //get data from firestore
  void getData () async{
    print('posting data');
    var snap = await _db.collection("users").doc(userInfo?.uid).get();
    ref.read(userDataProvider.notifier).fromMap(snap.data());
  }
  //send data to firestore
  void postData(){
    print('posting data');
    _db.collection("users").doc(userInfo?.uid).update({"history": ref.read(userDataProvider).history}).then((value) => print("History Updated"));
    _db.collection("users").doc(userInfo?.uid).update({"foods": ref.read(userDataProvider).foods}).then((value) => print("Foods Updated"));
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
      //Initialise data in firebase
      postDataToFirestore(data);
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
  postDataToFirestore(data) async {
    print('posting data');
    User? userInfo = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection("users").doc(userInfo?.uid).set(
      {"name": data.additionalSignupData["nickname"],
      "email": userInfo?.email,
      "uid": userInfo?.uid,
      "birthdate": "",
      "foods": {},
      "history": {}});
  }
}