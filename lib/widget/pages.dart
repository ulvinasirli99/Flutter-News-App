import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/home.dart';
import 'package:flutter_news_app/screens/origin.dart';
import 'package:flutter_news_app/screens/search.dart';

PageView buildPageViews(PageController controller) {
  return PageView(
    controller: controller,
    children: [
      Home(),
      SearchPage(),
      OrignPage(),
    ],
  );
}
