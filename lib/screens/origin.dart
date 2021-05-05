import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/bloc/theme_bloc.dart';
import 'package:flutter_news_app/bloc/theme_events.dart';
import 'package:flutter_news_app/enum/apptheme.dart';
import 'package:flutter_news_app/utils/prefernces.dart';

class OrignPage extends StatefulWidget {
  @override
  _OrignPageState createState() => _OrignPageState();
}

class _OrignPageState extends State<OrignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Switch(
            activeColor: Colors.green,
            inactiveTrackColor: Colors.red[500],
            value: Preferences.getTheme() == AppTheme.lightTheme,
            onChanged: (value) {
              _setTheme(value);
            },
          ),
        ],
      ),
      body: Center(child: Text("Dark Mode Switched and \n\n The rest will be done soon"),),
    );
  }

  _setTheme(bool darkTheme) async {
   
    AppTheme selectedTheme =
   
        darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;

    BlocProvider.of<ThemeBloc>(context)
        .add(ThemeEvent(appTheme: selectedTheme));

    Preferences.saveTheme(selectedTheme);
  }
}
