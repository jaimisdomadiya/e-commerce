import 'package:MyApp/components/social_card.dart';
import 'package:MyApp/constants.dart';
import 'package:MyApp/screen/sign_up/components/sign_up_form.dart';
import 'package:MyApp/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Text("Register Account",
                style: headingStyle,  
              ),
              Text(
                "Complete your detail or continue \nwith social media",
                textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SignUpForm(), 
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: "assets/icons/google-icon.svg",
                        press: (){},
                      ),
                      SocialCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: (){},
                      ),
                      SocialCard(
                        icon: "assets/icons/twitter.svg",
                        press: (){},
                      ),
                      
                    ],
                  ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),                     
            ],
          ),
        ),
      ),
    );
  }
}

