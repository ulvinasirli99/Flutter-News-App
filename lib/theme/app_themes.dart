import 'package:flutter/material.dart';
import 'package:flutter_news_app/enum/apptheme.dart';

class AppThemes {
 
  static final appThemeData = {
 
    AppTheme.lightTheme: ThemeData(
 
      scaffoldBackgroundColor: Colors.white,
 
      primarySwatch: Colors.blue,
 
      backgroundColor: Colors.white,
 
    ),
 
    AppTheme.darkTheme: ThemeData(
 
      scaffoldBackgroundColor: Colors.indigoAccent[700],
 
      primarySwatch: Colors.teal,
 
      backgroundColor: Colors.indigoAccent[700],

 
    ),
 
  };

}