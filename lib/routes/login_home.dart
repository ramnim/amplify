import 'package:flutter/material.dart';
import 'package:amplify/BLoC/log_in.dart';
import 'package:amplify/routes/sign_up.dart';
import 'package:amplify/custom_widgets/custom_button.dart';
import 'package:amplify/custom_widgets/custom_text.dart';
import 'package:amplify/custom_widgets/custom_text_field.dart';

class LoginHome extends StatelessWidget {
  /// Using the following _userName as mutable,
  /// That is OK, we are not reloading the widget,
  /// just rebuilding. If at all we need to preserve the
  /// state after reloading then we will convert this class
  /// to StatefulWidget.
  String _userName = '';
  String _password = '';

  @override
  Widget build (BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold (
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            amplifyLogo(height: _height * 0.1),
            CustomTextField(hintText: 'Username or Email address',
              assignValueCallback: (value) {
                _userName = value;
                print ('----- username: $_userName -----');
              },
            ),
            SizedBox(height: 10,),
            //PasswordTextField(),
            CustomTextField(hintText: 'Password',
              obscureText: true,
              assignValueCallback: (value) {
                _password = value;
                print ('----- password: $_password -----');
              },
            ),
            //ForgottenPassword(),
            SizedBox(height: _height*0.025,),
            CustomText(regText: 'Forgotten password?',
              align: MainAxisAlignment.end,
              callback: () => print ('---- clicked on forgotten password ----'),
            ),
            SizedBox(height: _height*0.025,),
            CustomButton(text: 'LOG IN',
              fontColor: Colors.black,
              onPressed: () => LogIn(context, _userName, _password).process,
            ),
            SizedBox(height: _height*0.025,),
            CustomText(regText: " Continue with Facebook",
              align: MainAxisAlignment.center,
              leadingImage: 'facebook.jpg',
              callback: () => print ('---- clicked on facebook ----'),
            ),
            CustomText(regText: " Continue with Google",
              align: MainAxisAlignment.center,
              leadingImage: 'google.jpg',
              callback: () => print ('---- clicked on google ----'),
            ),
            SizedBox(height: _height * 0.1, width: _width * 0.8,
              child:Divider(color: Colors.white,),
            ),
            CustomText(regText: "Don't have a account? ",
              boldText: "Sign Up",
              align: MainAxisAlignment.center,
              callback: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (routeContext) => SignUp())
              ),
            ),
          ],
        ),
      ),
    );
  }
  /// Logo at Top of LoginPage
  Widget amplifyLogo({double height}) {
    return Container(
      height: height,
      child: Text('Amplify',
        style: TextStyle(color: Colors.amberAccent, fontSize: 25,),
      ),
    );
  }

}
