import 'package:flutter/material.dart';

class ThemeConfiguration {
  static ThemeData themeData(TargetPlatform platform) {
    if (platform == TargetPlatform.android) {
      return new ThemeData(
          //controls the app bar colour , textview underlines
          primaryColor: Colors.pinkAccent,
        // background canavas colour,
         canvasColor: Colors.white,
         accentColor: Colors.black,

//swatch is a litte icon on textviews
          primarySwatch: Colors.green,
         disabledColor: Colors.red,

          // hintColor: Colors.blue,
            
          buttonColor: Colors.redAccent[200]);
    } else {}
  }

  static TextStyle appBarTextStyle(TargetPlatform platform) {
    if (platform == TargetPlatform.android) {
      return new TextStyle(
       // fontFamily: "jose",
        fontSize: 28.0,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );
    } else {}
  }
}
