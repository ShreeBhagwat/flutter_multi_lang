import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_multi_lang/Languages/language_data.dart';
import 'package:flutter_multi_lang/Languages/languages.dart';
import 'package:flutter_multi_lang/Languages/localisation_pref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Languages.of(context) != null ?
              Languages.of(context)!.textLabel : 'Text' ,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            _createLanguageDropDown(),
          ],
        ),
      ),
    );
  }

  _createLanguageDropDown() {
    return DropdownButton<LanguageData>(
      iconSize: 30,
      hint: Text(Languages.of(context)!.labelSelectLanguage),
      onChanged: (LanguageData? language) {
        print('Here');

        changeLanguage(context, language!.languageCode);
      },
      items: LanguageData.languageList()
          .map<DropdownMenuItem<LanguageData>>(
            (e) => DropdownMenuItem<LanguageData>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
