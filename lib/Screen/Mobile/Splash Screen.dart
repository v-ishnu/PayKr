import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:paykr/Screen/Mobile/Login.dart';
import 'package:paykr/Screen/Mobile/OnBoarding.dart';
import 'package:paykr/Utilities/BottomNav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(const Duration(seconds: 2), () {});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    User? user = FirebaseAuth.instance.currentUser;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    } else if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavBar()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            child: Center(
              child: Lottie.asset('Assets/Splash Screen Annimation.json',
                fit: BoxFit.cover
              ),
            ),
          ),
          const Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image(
                  image: AssetImage("Assets/Logo/Logo.png"),
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
