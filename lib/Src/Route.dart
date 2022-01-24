import 'package:flutter/material.dart';
import 'Log/Login.dart';
import 'Profile/Chat.dart';
import 'Home/HomeScreen.dart';
import 'Register/signup.dart';
import 'Student/ProScreen.dart';

class Routing extends StatelessWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ProScreen(),
        '/SignUp': (context) => const SignUp(),
        '/Login': (context) => const LoginPage(),
        '/ProfileList': (context) => const ProScreen(),
        '/Chat': (context) => const ChatScreen(),
      },
    );
  }
}
