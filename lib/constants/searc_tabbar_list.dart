import 'package:flutter_news_app/model/custom_tabbar_text_form.dart';

List<CustomTabbarTextForm> getTabbarTexts() {
  List<CustomTabbarTextForm> textList = new List();

  CustomTabbarTextForm customTabbarTextForm = new CustomTabbarTextForm();

  customTabbarTextForm.tabText = "Business";
  textList.add(customTabbarTextForm);
  customTabbarTextForm = new CustomTabbarTextForm();

  customTabbarTextForm.tabText = "Entertainment";
  textList.add(customTabbarTextForm);
  customTabbarTextForm = new CustomTabbarTextForm();

  customTabbarTextForm.tabText = "General";
  textList.add(customTabbarTextForm);
  customTabbarTextForm = new CustomTabbarTextForm();

  customTabbarTextForm.tabText = "Health";
  textList.add(customTabbarTextForm);
  customTabbarTextForm = new CustomTabbarTextForm();

  customTabbarTextForm.tabText = "Sports";
  textList.add(customTabbarTextForm);
  customTabbarTextForm = new CustomTabbarTextForm();

  customTabbarTextForm.tabText = "Science";
  textList.add(customTabbarTextForm);
  customTabbarTextForm = new CustomTabbarTextForm();

  customTabbarTextForm.tabText = "Technology";
  textList.add(customTabbarTextForm);
  customTabbarTextForm = new CustomTabbarTextForm();

  return textList;
}
