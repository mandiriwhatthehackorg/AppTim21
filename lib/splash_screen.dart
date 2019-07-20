import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:xplore_mandiri/onboarding/views/create_session_screen.dart';
import 'my_widget.dart';
import 'navigationn/navigation_screen.dart';
import 'strings.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  goToLogin() {
    Timer(Duration(seconds: 2), () async {
      var ref = await SharedPreferences.getInstance();
      var token = ref.getString(TOKEN) ?? null;
      //if (token != null) {
//        Navigator.pushReplacement(
//            context, MaterialPageRoute(builder: (c) => NavigationScreen()));
//      }
//      else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => NavigationScreen()));
      //}
    });
  }

  @override
  void initState() {
    goToLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: mainLogo(116.6, 64.0),
          ),
          Positioned(
            bottom: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset(
                "assets/images/footer.png",
                width: 266.0,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
