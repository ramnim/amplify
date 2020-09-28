/// Specify Fonts, Theme, Colors, Sizes in this file
import 'package:flutter/material.dart';

ThemeData ApplicationTheme (BuildContext context) {
  return Theme.of(context).copyWith(
    textTheme: Theme.of(context).textTheme.apply(
      fontFamily: 'Poppins',
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    primaryTextTheme: Theme.of(context).textTheme.apply(
      fontFamily: 'Poppins',
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    accentTextTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.white,
    accentColor: Colors.white,
  );
}

class TextStyle14 extends TextStyle {
  TextStyle14(): super(fontSize: 14, color: Colors.white);
}
class Text14 extends Text {
  Text14(String anyText, {TextAlign textAlign})
    : super(anyText, style: TextStyle14(), textAlign: textAlign);
}

const emailLength = 99;
const passwordLength = 12;
