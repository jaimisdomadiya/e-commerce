import 'package:MyApp/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';



class SignInScreen extends StatefulWidget {
  static String routeName = "/Sign_in";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In',
        style: TextStyle(
          color: kPrimaryColor,
          ),
        ),
      ),
      body: Body(),
      
    );
  }
}


