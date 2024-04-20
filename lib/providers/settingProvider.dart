import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier{
  String currentLang = "en";
  Future<void> changeLang(String newLang)async{
    if(currentLang == newLang)
      {
        return;
      }
    currentLang = newLang;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", newLang);
  }
  Future<void> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString("lang");
    if (lang != null) {
      currentLang = lang;
      notifyListeners();
    }
  }

}