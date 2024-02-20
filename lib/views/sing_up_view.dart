import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; 

import '../constants.dart';
import '../helper/snak_bar.dart';
import '../widgets/Custom_button.dart';
import '../widgets/field.dart';
import '../widgets/text_feild.dart';
import 'login_view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  static String id = "SignUpView";
  String? fullName;
  String? phoneNumber;
  String? email;
  String? password;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: CircleAvatar(
                backgroundColor: Color(0xfff8fbfb),
                radius: kPrimaryPadding * 5,
                backgroundImage: AssetImage(
                  kPrimaryLogo,
                ),
              ),
            ),
            const CustomField(field: "Full name"),
            CustomTextField(
              icon: Icons.abc_sharp,
              onchanged: (data) {
                fullName = data;
              },
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return "required feild";
                } else if (data.length < 3) {
                  return "the name must be more than 3 letters";
                } else {
                  return null;
                }
              },
              label: "Full name",
            ),
            const CustomField(field: "Phone number"),
            CustomTextField(
              icon: Icons.phone_iphone,
              hinttext: "01012345678",
              onchanged: (data) {
                phoneNumber = data;
              },
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return "required feild";
                } else if (data.length != 11) {
                  return 'Mobile Number must be of 10 digit';
                } else if (data.isEmpty) {
                  return "required feild";
                } else {
                  return null;
                }
              },
              label: "Phone number",
            ),
            const CustomField(field: "Email"),
            CustomTextField(
              icon: Icons.email,
              onchanged: (data) {
                email = data;
              },
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return "required feild";
                }
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = RegExp(pattern);
                if (!regex.hasMatch(data)) {
                  return 'Enter Valid Email';
                } else {
                  return null;
                }
              },
              hinttext: "username@gmial.com",
              label: "Email adress",
            ),
            const CustomField(field: "Password"),
            CustomTextField(
              icon: Icons.security_rounded,
              onchanged: (data) {
                password = data;
              },
              validator: (data) {
                if (data!.isEmpty) {
                  return "required feild";
                } else if (data.length < 8) {
                  return "the password must be more than 8 letters ";
                } else if (!data.contains('@') &&
                    !data.contains('*') &&
                    !data.contains('_') &&
                    data.contains('#') &&
                    data.contains('\$')) {
                  return "weak password the password must contain _ or special sing as # or * ";
                } else {
                  return null;
                }
              },
              label: "Password",
            ),
            CustomButton(
              onpressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    Navigator.pushNamed(context, LoginView.id);

                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showSnakBar(
                          context, 'The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      showSnakBar(context,
                          'The account already exists for that email.');
                    }
                  }
                }
              },
              topPadding: 10,
              leftPadding: 50,
              rightPadding: 50,
              label: "SignUp",
            ),
        const    Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                Text(
                  " LogIn",
                  style: TextStyle(
                      color: kPrimaryColor, fontSize: kPimaryFontSize),
                )
              ],
            ),
            Divider(
              height: 8,
              thickness: 1,
              color: Colors.grey.withOpacity(.5),
              indent: 100,
              endIndent: 100,
            )
          ],
        ),
      ),
    );
  }
}
