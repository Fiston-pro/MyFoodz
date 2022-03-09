import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart'; //Package for login page
import 'package:myfoodz/Screens/SplashScreen.dart';
import 'package:myfoodz/service.dart'; //firebase


const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};


class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);
  AuthService authService = new AuthService();


  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      //title: 'My Foodz',
      logo: AssetImage("assets/logo.png").assetName,
      onLogin: authService.authUser,
      onSignup: authService.signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SplashScreen(),
        ));
      },
      onRecoverPassword: authService.resetPassword,
      theme: LoginTheme(
        logoWidth: 0.8,
        primaryColor: Colors.green,
        accentColor: Colors.green,
        pageColorDark: Color.fromRGBO(189, 225, 181, 1),
        pageColorLight: Colors.green,
        inputTheme: InputDecorationTheme(prefixIconColor: Colors.green),
        cardTheme: CardTheme(shadowColor: Colors.green)

      ),
    );
  }

}