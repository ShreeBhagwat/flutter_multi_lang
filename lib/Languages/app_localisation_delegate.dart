import 'package:flutter/material.dart';
import 'package:flutter_multi_lang/Languages/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'id', 'hi'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        print("locale.languageCode: ${locale.languageCode}");

        return LanguagesEN();
      case 'id':
        print("locale.languageCode: ${locale.languageCode}");

        return LanguagesBA();
      case 'hi':
        print("locale.languageCode: ${locale.languageCode}");

        return LanguagesHI();
      default:
        return LanguagesEN();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
