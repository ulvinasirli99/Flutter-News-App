import 'package:flutter/material.dart';
import 'package:flutter_news_app/colors/custom_color.dart';

class BreakingNewsCard extends StatelessWidget {
  final String newsImgUrl;
  final String newsTitle;
  final String newsDesc;
  final String newsTime;

  BreakingNewsCard(
      this.newsImgUrl, this.newsTitle, this.newsDesc, this.newsTime);

  CustomColor customColor = new CustomColor();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18, top: 10),
          child: Container(
            width: 180,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  newsImgUrl,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 10),
          child: Text(
            "${newsTitle}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 5),
          child: Text(
            newsDesc,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: customColor.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            top: 5,
          ),
          child: Text(
            newsTime,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: customColor.grey,
            ),
          ),
        ),
      ],
    );
  }
}
