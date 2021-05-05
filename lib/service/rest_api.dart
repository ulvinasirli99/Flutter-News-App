import 'dart:convert';
import 'package:flutter_news_app/model/news_model.dart';
import 'package:flutter_news_app/model/sources_model.dart';
import 'package:http/http.dart' as http;


  //Todo This line in  is  Everything News.
  Future<NewsModel> everythingNews() async {

    try {
      final response = await http.get(Uri.parse(
    
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=7474d56961b54acea60532f6055dc288&language=tr&sortBy=popularity"));

    if (response.statusCode == 200) {
   
      var json = jsonDecode(response.body);

      return NewsModel.fromJson(json);
   
    } else {
   
      print("olmadi qaqa");
   
    }
    } catch (e) {
    print(e.toString());
    }
  
  }



  //Todo This line in  is Top Headlines News.
  Future<NewsModel> topHeadlinesNews(String category) async {
 
    try {
      
      final response = await http.get(Uri.parse(
 
        "https://newsapi.org/v2/top-headlines?country=tr&apiKey=7474d56961b54acea60532f6055dc288&category=$category"));

    if (response.statusCode == 200) {
 
      var json = jsonDecode(response.body);

      return NewsModel.fromJson(json);
 
    } else {
 
      print("olmadi qaqa");
 
    }

    } catch (e) {
   
    print(e.toString());
   
    }
 
  }


  //Todo This line in  is Sources News.
  Future<SourceModel> sourceNews() async {
    
  try {

      final response = await http.get(Uri.parse(
    
        "https://newsapi.org/v2/top-headlines?country=tr&apiKey=7474d56961b54acea60532f6055dc288&category=entertainment"));

    if (response.statusCode == 200) {
    
      var json = jsonDecode(response.body);

      return SourceModel.fromJson(json);
    
    } else {
    
      print("olmadi qaqa");
    
    }
    
  } catch (e) {

    print(e.toString());

  }
  
  }
