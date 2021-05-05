import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/colors/custom_color.dart';
import 'package:flutter_news_app/widget/pages.dart';
import 'package:flutter_news_app/widget/tabs.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  CustomColor color = new CustomColor();
  NavTabs navTabs = new NavTabs();
  PageController pageController = PageController();
  final _scaffoldState = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      int currentIndex = pageController.page.round();
      if (currentIndex != _currentIndex) {
        _currentIndex = currentIndex;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: buildPageViews(pageController),
      bottomNavigationBar: FancyBottomNavigation(
        activeIconColor: color.white,
        circleColor: color.orange,
        barBackgroundColor: color.white,
        inactiveIconColor: color.orange,
        tabs: navTabs.navTabs,
        onTabChangedListener: (position) {
          setState(() {
            _currentIndex = position;
          });
          pageController.jumpToPage(position);
        },
      ),
    );
  }
}
