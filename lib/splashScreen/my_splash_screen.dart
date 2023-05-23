import 'dart:async';

import 'package:amazonclone_user_app/mainScreens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  // Timer
  splashScreenTimer() {
    Timer(const Duration(seconds: 3), () {
      //user is already logged-in
      if(FirebaseAuth.instance.currentUser != null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (c) => const HomeScreen()));
      }
      else
      {

      }

    });
  }

  @override
  void initState() {
    splashScreenTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.teal.shade300,
              Colors.teal.shade800,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset("images/welcome.png"),
              ),
              const SizedBox(height: 10),
              const Text(
                "iShop Users App",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
