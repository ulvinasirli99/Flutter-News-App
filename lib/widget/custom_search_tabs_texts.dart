import 'package:flutter/material.dart';

class CustomSearchTabsTexts extends StatelessWidget {
  final String tabText;
  final bool checkOnTap;

  const CustomSearchTabsTexts(this.tabText, this.checkOnTap);

  @override
  Widget build(BuildContext context) {
    return Text(
      tabText,
      style: TextStyle(
        fontSize: 22,
        color: checkOnTap == true ? Colors.black : Colors.grey[400],
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
