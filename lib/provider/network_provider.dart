import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/news_model.dart';
import 'package:flutter_news_app/model/sources_model.dart';
import 'package:flutter_news_app/service/rest_api.dart';

class NetworkProvider extends ChangeNotifier{

  NewsModel allNewsModel = NewsModel();

  bool loadingData = false;

  Future<NewsModel> getNewsData(String newsCategoryName) async {

    loadingData = true;

    allNewsModel = await topHeadlinesNews(newsCategoryName);

    loadingData = false;

    notifyListeners();

  }


}