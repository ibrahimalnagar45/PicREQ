import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/Custom_button.dart';
import '../widgets/custom_drawer.dart';
import 'login_view.dart';
import 'sing_up_view.dart'; 

class HomeView extends StatelessWidget {
  HomeView({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer:const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200, bottom: 50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kPrimaryPadding * 1.5),
              child: Image.asset(
                kPrimaryLogo,
                height: 200,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomButton(
                  label: 'LogIn',
                  onpressed: () {
                    Navigator.pushNamed(context, LoginView.id);
                  },
                  leftPadding: kPrimaryPadding,
                  rightPadding: kPrimaryPadding,
                ),
              ),
              CustomButton(
                label: 'or',
                onpressed: () {},
                leftPadding: 10,
                rightPadding: 10,
                width: 40,
              ),
              Expanded(
                child: CustomButton(
                  label: 'SignUp',
                  onpressed: () {
                    Navigator.pushNamed(context, SignUpView.id);
                  },
                  leftPadding: kPrimaryPadding,
                  rightPadding: kPrimaryPadding,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
