import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoodz/Screens/signin.dart';
import 'package:myfoodz/service.dart';
import 'package:page_transition/page_transition.dart';
import 'package:myfoodz/Screens/Home.dart';

class SplashScreen extends ConsumerStatefulWidget  {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    super.initState();
    //database stuff
    FirebaseAuth.instance.currentUser != null ? ref.read(databaseProvider).getData() : null;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color.fromRGBO(189, 225, 181, 1),
      splash: Image.asset('assets/logo.png'),
      splashIconSize: double.infinity,
      //checks if the user is signed in and goes to homepage or to first sign them in
      nextScreen: FirebaseAuth.instance.currentUser != null ? HomePage() : LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
