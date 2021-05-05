import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/colors/custom_color.dart';
import 'package:flutter_news_app/model/news_model.dart';
import 'package:flutter_news_app/screens/home_detail.dart';
import 'package:flutter_news_app/service/rest_api.dart';
import 'package:flutter_news_app/widget/breaking_news_card.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CustomColor customColor = new CustomColor();

  Future<NewsModel> getAllNews;

  Random random = new Random();

  int randomHomeImgUrl = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNews = everythingNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAllNews,
        builder: (context, AsyncSnapshot<NewsModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          }
          return Container(
            child: Stack(
              children: [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3),
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              snapshot
                                  .data.articles[randomHomeImgUrl].urlToImage
                                  .toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Icon(
                                Icons.menu_sharp,
                                size: 30,
                                color: customColor.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 50),
                              child: Container(
                                width: 140,
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "News of the day",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: customColor.white,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35,
                                top: 35,
                                right: 5,
                              ),
                              child: Text(
                                snapshot.data.articles[2].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: customColor.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40, top: 30),
                              child: GestureDetector(
                                onTap: () {
                                  showToast("Hele hazir deyil",
                                      context: context);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "LearnMore",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: customColor.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: customColor.white,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 10,
                                  ),
                                  child: Text(
                                    "Breaking News",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: customColor.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20,
                                    top: 15,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      showToast("Hele hazir deyil",
                                          context: context);
                                    },
                                    child: Text(
                                      "More",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: customColor.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: FutureBuilder(
                                future: getAllNews,
                                builder: (context,
                                    AsyncSnapshot<NewsModel> snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data.articles.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeDetailPage(
                                                  snapshot.data.articles[index]
                                                      .urlToImage,
                                                  "Breaking",
                                                  snapshot.data.articles[index]
                                                      .title,
                                                  snapshot.data.articles[index]
                                                      .content,
                                                  snapshot.data.articles[index]
                                                      .source.name
                                                      .substring(0, 10),
                                                  snapshot.data.articles[index]
                                                      .urlToImage,
                                                  snapshot.data.articles[index]
                                                      .publishedAt.hour
                                                      .toString(),
                                                  snapshot.data.articles[index]
                                                      .description
                                                      .substring(0, 220),
                                                ),
                                              ),
                                            );
                                          },
                                          child: BreakingNewsCard(
                                              snapshot.data.articles[index]
                                                  .urlToImage
                                                  .toString(),
                                              snapshot.data.articles[index]
                                                  .description
                                                  .substring(0, 25),
                                              "${snapshot.data.articles[index].title.substring(0, 23)}...",
                                              "${snapshot.data.articles[index].publishedAt.hour.toString()} h ago"),
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(snapshot.hasError.toString()),
                                    );
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
