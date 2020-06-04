import 'package:flutter/cupertino.dart';
import 'package:flutter_internationalization/localization/app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // constructor
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // all our supported languages
    return ['en', 'ms'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load(locale);
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}