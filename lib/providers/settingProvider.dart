import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  String currentLang = "en";
  void changeLang(String newLang){
    if(currentLang == newLang)
      {
        return;
      }
    currentLang = newLang;
    notifyListeners();
  }

}