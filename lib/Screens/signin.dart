import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart'; //Package for login page
import 'package:myfoodz/Screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart'; //firebase


const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

var uid;

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    //debugPrint('Name: ${data.name}, Password: ${data.password}');
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
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

  Future<String?> _signupUser(SignupData data) async {
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

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "null";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'My Foodz',
      logo: AssetImage("assets/logo.png").assetName,
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}