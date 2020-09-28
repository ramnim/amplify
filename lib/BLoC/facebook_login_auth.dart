//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
//Future<dynamic> loginWithFacebook() async {
//  final result = await FacebookAuth.instance.login();
//  var userData;
//  switch (result.status) {
//    case FacebookAuthLoginResponse.ok:
//      // get the user data
//      //final userData = await FacebookAuth.instance.getUserData();
//      userData = await FacebookAuth.instance.getUserData();
//      break;
//    case FacebookAuthLoginResponse.cancelled:
//      print("login cancelled");
//      break;
//    default:
//      print("login failed");
//  }
//  return userData;
//}
