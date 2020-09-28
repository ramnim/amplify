import 'package:flutter/material.dart';
import 'package:amplify/config/consts.dart';
import 'package:amplify/routes/busy_page.dart';
import 'package:amplify/custom_widgets/custom_dialog.dart';

///
/// All login business rules go here.
///
class LogIn {
  final _context;
  final _userName;
  final _password;
  LogIn(this._context, this._userName, this._password);

  get process async {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_userName)) {
      /// e-mail or user name is good
      print ('---- $_userName is good -----');
      await customDialog(context: _context, title: 'SUCCESS',
          text: 'Your e-mail is good, proceed to login.',
          dlgType: DlgType.SUCCESS
      );
      Navigator.of(_context).push(MaterialPageRoute(
        builder: (routeContext) => BusyPage(),
      ));
    } else {
      /// wrong e-mail, show the error to user
      print ('---- $_userName is wrong -----');
      customDialog(context: _context, title: 'ERROR',
        text: 'Invalid e-mail, please correct it and try again.',
        dlgType: DlgType.ERROR
      );
    }
  }
}