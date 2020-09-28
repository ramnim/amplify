import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amplify/config/theme.dart';
import 'package:amplify/config/consts.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
/// Generic class to be used for
/// - User name / email field
/// - Password field
/// - Any other input field
class CustomTextField extends StatelessWidget {
  final bool obscureText; // 'true' for password field
  final String regExp; // list of charters to be allowed
  final hintText;
  final borderColor;
  final StringToVoid assignValueCallback;

  CustomTextField({Key key,
    @required this.hintText,
    this.obscureText,
    this.regExp,
    this.borderColor,
    this.assignValueCallback,
  }) : super (key: key);

  //TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// make new set of fields from parent object
    String _regExp = regExp ?? "[a-zA-Z0-9.@-_]";
    String _hintText = hintText ?? "Enter Text";
    bool _obscureText = obscureText ?? false;
    Color _borderColor = borderColor ?? Colors.white;

    double _width = MediaQuery.of(context).size.width * 0.8;
    double _height = 45;
    return Container(
      width: _width,
      height: _height,
      padding: EdgeInsets.only(left:10,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: _borderColor,
          width: 1,
        ),
      ),
      child: TextField(
        obscureText: _obscureText,
        //controller: _controller,
        //keyboardType: TextInputType.emailAddress,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(_regExp)),
          //FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9.@_-]")),
          //FilteringTextInputFormatter.deny(RegExp('[/\\\\]')),
        ],
        //style: TextStyle (fontSize: 14.0, ),
        style: TextStyle(color: _borderColor),
        cursorColor: _borderColor,
        decoration: InputDecoration(
          hintText: _hintText,
          hintStyle: TextStyle(color: _borderColor),
          counterText: "",
          //contentPadding: EdgeInsets.only (left:5,),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        onChanged: (value) {
          if (assignValueCallback != null) {
            assignValueCallback(value);
          }
        },
      ),
    );
  }
}
