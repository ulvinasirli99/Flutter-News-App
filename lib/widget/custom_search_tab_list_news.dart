import 'package:flutter/material.dart';

class CustomSearchTabListNews extends StatelessWidget {
  final String newsTitle;
  final String newsContent;
  final String newsTimeAgo;
  final String newsImgUrl;

  CustomSearchTabListNews(
    this.newsTitle,
    this.newsContent,
    this.newsTimeAgo,
    this.newsImgUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(newsImgUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              newsContent,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Icon(
                  Icons.lock_clock,
                  size: 20,
                  color: Colors.grey[300],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${newsTimeAgo} hours ago",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
