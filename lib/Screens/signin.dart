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

  //recover password
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
      onLogin: authService.authUser,
      onSignup: authService.signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SplashScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }

}