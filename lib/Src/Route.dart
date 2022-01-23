import 'package:flutter/material.dart';
import 'Log/Login.dart';
import 'Home/Chat.dart';
import 'Home/HomeScreen.dart';
import 'Register/signup.dart';
import 'Profile/ProScreen.dart';

class Routing extends StatelessWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/SignUp': (context) => const SignUp(),
        '/Login': (context) => const LoginPage(),
        '/Profile': (context) => const ProScreen(),
      },
    );
  }
}
