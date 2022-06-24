// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_multi_lang/Languages/app_localisation_delegate.dart';
import 'package:flutter_multi_lang/Languages/localisation_pref.dart';
import 'package:flutter_multi_lang/home_screen.dart';

void main() {
  runApp(FlutterMultiLang());
}

class FlutterMultiLang extends StatefulWidget {
  const FlutterMultiLang({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_FlutterMultiLangState>();
    state!.setLocale(newLocale);
  }

  @override
  State<FlutterMultiLang> createState() => _FlutterMultiLangState();
}

class _FlutterMultiLangState extends State<FlutterMultiLang> {
  Locale? _locale;

  void setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      home: HomeScreen(),
      supportedLocales: [Locale('en', ''), Locale('id', ''), Locale('hi', '')],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
