import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amplify/routes/login_home.dart';
import 'package:amplify/routes/facebook_google_login.dart';
import 'package:amplify/routes/email_signup.dart';
import 'package:amplify/custom_widgets/custom_button.dart';
import 'package:amplify/custom_widgets/custom_text.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    SvgPicture _svgFacebook = SvgPicture.asset("assets/icons/facebook-svgrepo-com.svg", color: Colors.white);
    SvgPicture _svgGoogle = SvgPicture.asset("assets/icons/google-svgrepo-com.svg");
    return Scaffold (
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            amplifyLogo(height: _height * 0.1),
            CustomText(regText: 'GAIN BACK CONTROL',
              align: MainAxisAlignment.center,
            ),
            CustomText(regText: 'OF YOUR LIFE',
              align: MainAxisAlignment.center,
            ),
            SizedBox(height: _height*0.05,),
            CustomButton(text: 'SIGN UP WITH FACEBOOK',
              bgColor: Colors.blue[700],
              fontColor: Colors.white,
              leading: _svgFacebook,
              onPressed: () { 
		Navigator.of(context).push(
		  MaterialPageRoute (builder: (_) => FacebookGoogleLogin(
		    title: 'Facebook Login',
		    selectedUrl: 'https://www.facebook.com'))
		);
              },
            ),
            SizedBox(height: _height*0.025,),
            CustomButton(text: 'SIGN UP WITH GOOGLE',
              bgColor: Colors.white,
              fontColor: Colors.black,
              leading: _svgGoogle,
              onPressed: () { 
		Navigator.of(context).push(
		  MaterialPageRoute (builder: (_) => FacebookGoogleLogin(
		    title: 'Google Login',
		    selectedUrl: 'https://accounts.google.com'))
		);
              },
            ),
            SizedBox(height: _height*0.025,),
            CustomText(regText: "Signup with Email address",
              align: MainAxisAlignment.center,
              callback: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => EmailSignup())
              ),
            ),
            SizedBox(height: _height*0.025,),
            SizedBox(height: _height * 0.1, width: _width * 0.8,
              child:Divider(color: Colors.white,),
            ),
            CustomText(regText: "Already have an account? ",
              boldText: "Sign in",
              align: MainAxisAlignment.center,
              callback: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => LoginHome())
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
