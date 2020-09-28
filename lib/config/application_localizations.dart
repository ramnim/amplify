import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocale {
  final Locale appLocale;

  AppLocale (this.appLocale);

  static AppLocale of (BuildContext context) {
    return Localizations.of<AppLocale>(context, AppLocale);
  }

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('assets/languages/${appLocale.languageCode}.json');
    Map<String, dynamic> jsonLanguageMap = json.decode(jsonString);
    _localizedStrings = jsonLanguageMap.map( (key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String jsonKey) {
    return _localizedStrings[jsonKey];
  }

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocaleDelegate();
}

class _AppLocaleDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocaleDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'te'].contains (locale.languageCode);
  }

  @override
  Future<AppLocale> load (Locale locale) async {
    AppLocale localizations = AppLocale(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload (_AppLocaleDelegate old) => false;
}
