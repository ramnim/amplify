import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amplify/config/theme.dart';
import 'package:amplify/config/consts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String size;
  final Color bgColor;
  final Color fontColor;
  final Widget leading;
  final VoidCallback onPressed;

  CustomButton ({Key key,
    @required this.text,
    this.size,
    this.bgColor,
    this.fontColor,
    this.leading,
    this.onPressed,
  })  : super (key: key) ;

  final defaultBgColor = Color(0xfff2d493);
  final defaultFontColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.8;
    double _height = 42;
    Color _bgColor = bgColor ?? defaultBgColor;
    Color _fontColor = fontColor ?? defaultFontColor;

    /// width of button is small, medium, big
    /// default big size of width
    switch (size) {
      case 'small':
        _width = _width / 4;
        break;
      case 'medium':
        _width = _width / 2;
        break;
      default :
        break;
    }

    return InkWell (
      child: Container (
      width: _width,
      height: _height,
      alignment: Alignment.center,
      decoration: BoxDecoration (
        color: _bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null)
            Container ( width: _height, height: _height / 2,
              child: leading,
            ),
          Text(text,
            style: TextStyle (fontSize: 14, color: _fontColor,),
          ),
        ],
      ),
      ),
      onTap: onPressed,
    );
  }
}
