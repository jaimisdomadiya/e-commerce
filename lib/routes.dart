import 'package:MyApp/screen/complete_profile/complete_profile_screen.dart';
import 'package:MyApp/screen/forgot_password/forgot_password_screen.dart';
import 'package:MyApp/screen/homepage/homepage_display.dart';
import 'package:MyApp/screen/login_success/login_success_display.dart';
import 'package:MyApp/screen/sign_in/sign_in_screen.dart';
import 'package:MyApp/screen/sign_up/sign_up_screen.dart';
import 'package:MyApp/screen/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';



final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomePageDisplay.routeName: (context) => HomePageDisplay(),
};