import 'dart:convert';
import 'package:flutter_news_app/enum/apptheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  //
  static SharedPreferences preferences;
 
  static const String KEY_SELECTED_THEME = 'switchMode';

  static init() async {
 
    preferences = await SharedPreferences.getInstance();
 
  }

  static void saveTheme(AppTheme selectedTheme) async {
 
    if (null == selectedTheme) {
 
      selectedTheme = AppTheme.lightTheme;
 
    }
 
    String theme = jsonEncode(selectedTheme.toString());
 
    preferences.setString(KEY_SELECTED_THEME, theme);
 
  }

  static AppTheme getTheme() {
 
    String theme = preferences.getString(KEY_SELECTED_THEME);
 
    if (null == theme) {
 
      return AppTheme.lightTheme;
 
    }
 
    return getThemeFromString(jsonDecode(theme));
 
  }

  static AppTheme getThemeFromString(String themeString) {
   
    for (AppTheme theme in AppTheme.values) {
   
      if (theme.toString() == themeString) {
   
        return theme;
   
      }
   
    }
   
    return null;
  
  }

}