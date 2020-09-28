/// Entry point for Flutter Application
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:amplify/config/theme.dart';
import 'package:amplify/routes/login_home.dart';
import 'package:amplify/config/application_localizations.dart';

void main() => runApp(RootMaterialRoute());


class RootMaterialRoute extends StatelessWidget {
  // The following widget is the Root of this Application
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      title: 'Amplify Test',
      theme: ApplicationTheme (context),
      home: LoginHome(),
      supportedLocales: [
        Locale ('en', 'US'), // English
        Locale ('te', 'IN'), // Telugu
      ],
      localizationsDelegates: [
        AppLocale.delegate,
	GlobalWidgetsLocalizations.delegate,
	GlobalMaterialLocalizations.delegate,
	GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocalLanguage in supportedLocales) {
	  if (supportedLocalLanguage.languageCode == locale.languageCode &&
	      supportedLocalLanguage.countryCode == locale.countryCode) {
	      return supportedLocalLanguage;
	  }
	}
      }
    );
  }
}
