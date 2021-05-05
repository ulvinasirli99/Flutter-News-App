import 'package:flutter/material.dart';
import 'package:flutter_news_app/constants/searc_tabbar_list.dart';
import 'package:flutter_news_app/model/custom_tabbar_text_form.dart';
import 'package:flutter_news_app/provider/network_provider.dart';
import 'package:flutter_news_app/screens/home_detail.dart';
import 'package:flutter_news_app/widget/custom_search_tab_list_news.dart';
import 'package:flutter_news_app/widget/custom_search_tabs_texts.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  String newsSearchText = "";
  String newsCategoryText = "";
  List<CustomTabbarTextForm> textList;
  bool checkSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    textList = getTabbarTexts();
    final headlinesNews = Provider.of<NetworkProvider>(context, listen: false);

    headlinesNews.getNewsData("health");

    print("Menim categorim : " + newsCategoryText);
  }

  @override
  Widget build(BuildContext context) {
    var headlinesNews = Provider.of<NetworkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: headlinesNews.loadingData
          ? Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: formKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45, left: 20),
                      child: Icon(
                        Icons.menu_sharp,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 40),
                      child: Text(
                        "Discover",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 40),
                      child: Text(
                        "News from all over the world",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 40, right: 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.grey[400],
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            //Todo TextForm Field
                            Expanded(
                              child: TextFormField(
                                onFieldSubmitted: (value) {
                                  if (value.isEmpty) {
                                    return "Is not search a blank";
                                  }

                                },
                                controller: textEditingController,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  border: InputBorder.none,
                                ),
                                onSaved: (value) {
                                  newsSearchText = value;
                                },
                                validator: (checkValue) {
                                  if (checkValue.isEmpty) {
                                    return "Search blank isn't empty";
                                  }
                                },
                                enableSuggestions: true,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.amp_stories,
                                size: 30,
                                color: Colors.grey[400],
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: textList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10, left: 7),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    //Todo Burda he kilike gore rengin deyismesi qaldi
                                    newsCategoryText = textList[index].tabText;
                                    headlinesNews.getNewsData(newsCategoryText);
                                  });
                                },
                                child: CustomSearchTabsTexts(
                                  "${textList[index].tabText}",
                                  checkSelected,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                      thickness: 1.0,
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: headlinesNews.allNewsModel.articles.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeDetailPage(
                                        headlinesNews.allNewsModel
                                            .articles[index].urlToImage,
                                        "General",
                                        headlinesNews
                                            .allNewsModel.articles[index].title,
                                        headlinesNews.allNewsModel
                                            .articles[index].content,
                                        headlinesNews.allNewsModel
                                            .articles[index].source.name
                                            .substring(0, 10),
                                        headlinesNews.allNewsModel
                                            .articles[index].urlToImage,
                                        headlinesNews.allNewsModel
                                            .articles[index].publishedAt.hour
                                            .toString(),
                                        headlinesNews.allNewsModel
                                            .articles[index].description
                                            .substring(0, 200),
                                      ),
                                    ),
                                  );
                                },
                                child: CustomSearchTabListNews(
                                  headlinesNews
                                      .allNewsModel.articles[index].title
                                      .substring(0, 20),
                                  headlinesNews
                                      .allNewsModel.articles[index].content
                                      .substring(0, 20),
                                  headlinesNews.allNewsModel.articles[index]
                                      .publishedAt.hour
                                      .toString(),
                                  headlinesNews
                                      .allNewsModel.articles[index].urlToImage,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
