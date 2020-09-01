import 'package:MyApp/components/custom_suffix_icon.dart';
import 'package:MyApp/components/default_button.dart';
import 'package:MyApp/components/form_error.dart';
import 'package:MyApp/screen/forgot_password/forgot_password_screen.dart';
import 'package:MyApp/screen/login_success/login_success_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

//   checkAuthentication() async {
//   _auth.onAuthStateChanged.listen((user) async { 
//     if (user != null){
//       Navigator.pushReplacementNamed(context, "/");
//     }
//   });
// }

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void signin() async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    try {
      AuthResult user = (await _auth.signInWithEmailAndPassword(email: email, password: password)); 
    } catch (e) {
      print("error");
    }
      Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    }
  }
  
  // @override
  // void initState(){
  //   super.initState();
  //   this.checkAuthentication();
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                Checkbox(
                  value: remember, 
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember= value;
                    });
                  },
                ),
                Text("Remember Me"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                  child: Text("Forgoot Password ?",
                    style: TextStyle(
                      // decoration: TextDecoration.overline,
                      color: Color(0xFF17bf2b),                     
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            FormErrorText(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: "Continue",
              press: signin,
            ),
          ],
        ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(         
      obscureText: true, 
      onSaved: (newValue) => password = newValue,
      onChanged: (value){
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
         
      decoration: InputDecoration(
        labelText: "Password",
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always, 
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
        
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value){
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: 'Enter your email',

        floatingLabelBehavior: FloatingLabelBehavior.always, 
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
        
      ),
    );
  }
}