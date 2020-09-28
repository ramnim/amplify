import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amplify/config/theme.dart';
import 'package:amplify/config/consts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomText extends StatelessWidget {
  final regText;
  final boldText;
  final fontColor;
  final align;
  final leadingImage;
  final VoidCallback callback;

  CustomText ({Key key,
    @required this.regText,
    this.boldText,
    this.fontColor,
    this.align,
    this.leadingImage,
    this.callback,
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.8;
    //double _height = MediaQuery.of(context).size.height * 0.05;
    double _height = 23; // default font size is 14, so using 15
    // if we have to use different font size then make it parameter

    MainAxisAlignment _rowAlign = align ?? MainAxisAlignment.end;
    Color _fontColor = fontColor ?? Colors.white;
    return Container(
      width: _width, height: _height,
      //padding: EdgeInsets.symmetric(vertical: 5,),
      alignment: Alignment.center,
      child: InkWell (
        child: Row(
          mainAxisAlignment: align,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            if (leadingImage != null)
              ClipRRect (
                borderRadius: BorderRadius.circular(300),
                child: Image.asset('assets/icons/$leadingImage',
                  fit: BoxFit.contain, width: 19, height:19,
                ),
              ),
            Text (regText, style: TextStyle(color: _fontColor)),
            if (boldText != null)
              Text(boldText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ]
        ),
        onTap: callback,
      ),
    );
  }
}
