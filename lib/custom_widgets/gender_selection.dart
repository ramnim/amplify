import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amplify/config/theme.dart';
import 'package:amplify/config/consts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int _radioValue = 0;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.8;
    return Container (
      width: _width,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Male', style: TextStyle(color:Colors.black)),
          Radio (
            value: 0,
            groupValue: _radioValue,
            onChanged: _radioValueChange,
          ),
          //SizedBox(width:50),
          ConstrainedBox(constraints: BoxConstraints(minWidth: 0.0, maxWidth: 20.0)),
          Text('Female', style: TextStyle(color:Colors.black)),
          Radio (
            value: 1,
            groupValue: _radioValue,
            onChanged: _radioValueChange,
          ),
          ConstrainedBox(constraints: BoxConstraints(minWidth: 0.0, maxWidth: 20.0)),
          Text('N/A', style: TextStyle(color:Colors.black)),
          //SizedBox(width:50),
          Radio (
            value: 2,
            groupValue: _radioValue,
            onChanged: _radioValueChange,
          ),
        ],
      ),
    );
  }
  void _radioValueChange (int value) {
    setState (() {
      _radioValue = value;
    });
  }
}
