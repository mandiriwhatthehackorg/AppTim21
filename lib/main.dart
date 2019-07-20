import 'package:flutter/material.dart';
import 'package:xplore_mandiri/splash_screen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
    theme: new ThemeData(
        primaryTextTheme: TextTheme(
            title: TextStyle(
                color: Colors.black
            )
        )
    )
));
