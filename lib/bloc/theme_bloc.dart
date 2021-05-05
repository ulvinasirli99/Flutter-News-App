import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/bloc/theme_events.dart';
import 'package:flutter_news_app/bloc/theme_state.dart';
import 'package:flutter_news_app/enum/apptheme.dart';
import 'package:flutter_news_app/theme/app_themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  ThemeBloc()
      : super(
            ThemeState(themeData: AppThemes.appThemeData[AppTheme.lightTheme]));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    // TODO: implement mapEventToState
    if(event is ThemeEvent){

      yield ThemeState(themeData: AppThemes.appThemeData[event.appTheme]);

    }
  }
}
