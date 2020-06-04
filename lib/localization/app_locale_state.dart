import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocaleState extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get appLocale => _locale ?? Locale('en');

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    if (prefs.getString('languageCode') == null) {
      _locale = Locale('en');
      return Null;
    }

    _locale = Locale(prefs.getString('languageCode'));
    return Null;
  }

  void changeLanguage(Locale locale) async {
    var prefs = await SharedPreferences.getInstance();
    if (_locale == locale)  {
      return;
    }

    if (locale == Locale('ms')) {
      _locale = Locale('ms');
      await prefs.setString('languageCode', 'ms');
      await prefs.setString('countryCode', 'MY');
    }
    else {
      _locale = Locale('en');
      await prefs.setString('languageCode', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}