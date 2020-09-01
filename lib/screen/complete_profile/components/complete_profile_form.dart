import 'package:MyApp/components/custom_suffix_icon.dart';
import 'package:MyApp/components/default_button.dart';
import 'package:MyApp/components/form_error.dart';
import 'package:MyApp/screen/homepage/homepage_display.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {

  final _formKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String mobileNumber;
  String address;
  
  final List<String> errors = [];

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMobileNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAdressFormField(),
          FormErrorText(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: (){
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
              Navigator.pushNamed(context, HomePageDisplay.routeName);
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAdressFormField() {
    return TextFormField(
        keyboardType: TextInputType.streetAddress,
        onSaved: (newValue) => address= newValue,
        onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kAddressNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kAddressNullError);
              return "";
            } 
            return null;
          },
        decoration: InputDecoration(
          labelText: "Address",
          hintText: 'Enter your address',
          floatingLabelBehavior: FloatingLabelBehavior.always, 
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Location point.svg",
           ),
         ),
        );
  }

  TextFormField buildMobileNumberFormField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        onSaved: (newValue) => mobileNumber= newValue,
        onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPhoneNumberNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kPhoneNumberNullError);
              return "";
            } 
            return null;
          },
        decoration: InputDecoration(
          labelText: "Mobile Number",
          hintText: 'Enter your mobile number',
          floatingLabelBehavior: FloatingLabelBehavior.always, 
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Phone.svg",
           ),
         ),
        );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
        keyboardType: TextInputType.name,
        onSaved: (newValue) => lastName= newValue,
        onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNamelNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kNamelNullError);
              return "";
            } 
            return null;
          },
        decoration: InputDecoration(
          labelText: "Last Name",
          hintText: 'Enter your last name',
          floatingLabelBehavior: FloatingLabelBehavior.always, 
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Mail.svg",
           ),
         ),
        );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
        keyboardType: TextInputType.name,
        onSaved: (newValue) => firstName= newValue,
        onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNamelNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kNamelNullError);
              return "";
            } 
            return null;
          },
        decoration: InputDecoration(
          labelText: "First Name",
          hintText: 'Enter your first name',
          floatingLabelBehavior: FloatingLabelBehavior.always, 
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Mail.svg",
           ),
         ),
        );
  }
}