import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart'; 
import '../constants.dart';
import '../helper/snak_bar.dart';
import '../widgets/Custom_button.dart';
import '../widgets/field.dart';
import '../widgets/text_feild.dart';
import 'general_page.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  static String id = "LoginView";
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
                foregroundImage: AssetImage(
                  kPrimaryLogo,
                ),
              ),
            ),
            const CustomField(field: "Full name"),
            CustomTextField(
              hinttext: "your name",
              icon: Icons.abc_rounded,
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
              hinttext: "01012345678",
              icon: Icons.phone_iphone,
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
            const CustomField(field: "Emial"),
            CustomTextField(
              hinttext: "username@gmial.com",
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
              label: "Email adress",
            ),
            const CustomField(field: "Password"),
            CustomTextField(
              icon: Icons.security_outlined,
              onchanged: (data) {
                password = data;
              },
              validator: (data) {
                if (data!.isEmpty) {
                  return "required feild";
                } else if (data.length < 8) {
                  return "the password must be more than 8 letters ";
                } else if (!data.contains('@') &&
                    data.contains('*') &&
                    data.contains('_') &&
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
                    Navigator.pushNamed(context, GeneralView.id);

                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      showSnakBar(context, 'No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      showSnakBar(
                          context, 'Wrong password provided for that user.');
                    }
                  }
                }
              },
              topPadding: 10,
              leftPadding: 50,
              rightPadding: 50,
              label: "LogIn",
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ? "),
                  Text(
                    "Sign up",
                    style: TextStyle(
                        color: kPrimaryColor, fontSize: kPimaryFontSize),
                  )
                ],
              ),
            ),

            Divider(
              height: 8,
              thickness: 1,
              color: Colors.grey.withOpacity(.5),
              endIndent: 100,
              indent: 100,
            ),
            const Center(child: Text("or continue with :")),
            CustomButton(
              onpressed: () {
                handleSignIn();
              },
              icon: "assets/icons/Google.f863aef4d15f1498abe6f2d498cdc987.png",
              topPadding: 10,
              leftPadding: 50,
              rightPadding: 50,
            )
            // IconButton(
            //   onPressed: () {
            //     handleSignIn();
            //   },
            //   icon: Image.asset(
            //     "assets/icons/OIP.jpeg",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

//   final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> handleSignIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  } // if result not null we simply call the MaterialpageRoute,
  // for go to the HomePage screen
}

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
