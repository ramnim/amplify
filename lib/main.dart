/// Entry point for Flutter Application
import 'package:flutter/material.dart';
import 'package:amplify/config/theme.dart';
import 'package:amplify/routes/login_home.dart';

void main() => runApp(RootMaterialRoute());


class RootMaterialRoute extends StatelessWidget {
  // The following widget is the Root of this Application

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'Amplify Test',
      theme: ApplicationTheme (context),
      home: LoginHome(),
    );
  }
}
