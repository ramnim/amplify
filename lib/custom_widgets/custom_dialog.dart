import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amplify/config/theme.dart';
import 'package:amplify/config/consts.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<bool> customDialog ({@required BuildContext context,
  String title, String text, DlgType dlgType}) async {
  title = title ?? 'Amplify';
  text = text ?? 'No text given by you!';

  Color _colorTitle = Colors.white;
  switch (dlgType) {
    case DlgType.ERROR:
      _colorTitle = Colors.redAccent;
      break;
    default:
      break;
  }

  return showDialog(context: context,
    barrierDismissible: false,
    builder: (BuildContext dlgContext) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 50.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.white),
                ),
                child: AlertDialog(
                  backgroundColor: Colors.black,
                  title: Text (title, style: TextStyle(color: _colorTitle)),
                  content: Text14 (text),
                  actions: [
                    FlatButton(
                      child: Text ('OK',style: TextStyle(color: Colors.white,),),
                      onPressed: () {
                        Navigator.of(dlgContext).pop(true);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
