import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appLabel;

  String get appName;

  String get textLabel;

  String get labelSelectLanguage;
}

class LanguagesEN extends Languages {
  @override
  String get appLabel => 'App';

  @override
  String get appName => 'Flutter Multi Lang';

  @override
  String get textLabel => 'Text';
  
  @override
  // TODO: implement labelSelectLanguage
  String get labelSelectLanguage => 'English';
}

class LanguagesBA extends Languages {
  @override
  String get appLabel => 'Aplikasi';

  @override
  String get appName => 'Flutter Multi Lang';

  @override
  String get textLabel => 'Teks';
  
  @override
  // TODO: implement labelSelectLanguage
  String get labelSelectLanguage => 'Bahasa';
}

class LanguagesHI extends Languages {
  @override
  String get appLabel => 'ऐप';

  @override
  String get appName => "बहु भाषा";

  @override
  String get textLabel => 'टेक्स';
  
  @override
  // TODO: implement labelSelectLanguage
  String get labelSelectLanguage => 'Hindi';
}

