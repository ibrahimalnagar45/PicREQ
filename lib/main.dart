import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; 
import 'firebase_options.dart';
import 'views/general_page.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/sing_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.id: (context) => HomeView(),
        LoginView.id: (context) => LoginView(),
        SignUpView.id: (context) => SignUpView(),
        GeneralView.id: (context) => GeneralView(),
        // PrevieView.id:(context) => PrevieView(),
      },
      debugShowCheckedModeBanner: false,
      home:const GeneralView(),
    );
  }
} 