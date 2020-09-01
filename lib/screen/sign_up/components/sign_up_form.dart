import 'package:MyApp/components/custom_suffix_icon.dart';
import 'package:MyApp/components/default_button.dart';
import 'package:MyApp/components/form_error.dart';
import 'package:MyApp/screen/complete_profile/complete_profile_screen.dart';
// import 'package:MyApp/screen/sign_in/components/sign_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String email;
  String password;
  String conform_password;
  final List<String> errors = [];

  checkAuthentication() async {
   _auth.onAuthStateChanged.listen((user) { 
     if(user != null) {
      Navigator.pushNamed(context, "/");
     }
   });
 }

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

 void signup() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      } catch (e) {
        print("error");
      }
      Navigator.pushNamed(context, CompleteProfileScreen.routeName);
    }    
  }

  @override
  void initState(){
    super.initState();
    this.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenWidth(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenWidth(20)),
          buildConfPasswordFormField(),
          FormErrorText(errors: errors),
          SizedBox(height: getProportionateScreenWidth(20)),
          DefaultButton(
            text: "Continue",
            press: signup,
            ),
        ],
      ),
    );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(         
          obscureText: true, 
          onSaved: (newValue) => conform_password = newValue,
          onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.isNotEmpty && password == conform_password) {
                removeError(error: kMatchPassError);
              }
              conform_password = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if ((password != value)) {
                addError(error: kMatchPassError);
                return "";
              }
              return null;
            },
          decoration: InputDecoration(
            labelText: "Confirm Password",
            hintText: 'Re-Enter your password',
            floatingLabelBehavior: FloatingLabelBehavior.always, 
            suffixIcon: CustomSuffixIcon(
              svgIcon: "assets/icons/Lock.svg",
            ),
          ),
        );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(         
          obscureText: true, 
          onSaved: (newValue) => password = newValue,
          onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              password = value;
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
          onChanged: (value) {
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