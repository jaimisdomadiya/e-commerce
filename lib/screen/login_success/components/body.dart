import 'package:MyApp/components/default_button.dart';
import 'package:MyApp/screen/homepage/homepage_display.dart';
import 'package:MyApp/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.5,
        ),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back To Home",
            press: () { 
             Navigator.pushNamed(context, HomePageDisplay.routeName);
            }
          ),
        ),
        Spacer(),
      ],
    );
  }
}