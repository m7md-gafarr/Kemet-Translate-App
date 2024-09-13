import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String language = "ar";
  bool selected = false;

  ChangeLanguageToEN() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("language", "en");
    preferences.setBool("selected", true);
    ReadLanguageAndSelected();

    notifyListeners();
  }

  ChangeLanguageToAR() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("language", "ar");
    preferences.setBool("selected", false);
    ReadLanguageAndSelected();

    notifyListeners();
  }

  ReadLanguageAndSelected() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    language = preferences.getString("language") ?? "ar";
    selected = preferences.getBool("selected") ?? false;
    notifyListeners();
  }
}
