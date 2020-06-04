import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_internationalization/localization/app_localizations_delegate.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations);

  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<bool> load(Locale locale) async {
    String jsonString = await rootBundle.loadString('assets/locale/locale_${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  String translate(String key) => _localizedStrings[key];
}