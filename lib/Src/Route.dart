import 'package:bus_station/Src/Log/chang_password.dart';
import 'package:bus_station/Src/Register/register_with_phone.dart';
import 'package:bus_station/Src/Register/verfication.dart';
import 'package:bus_station/Src/Register/verification.dart';
import 'package:bus_station/Src/Register/verification_input_number.dart';
import 'package:flutter/material.dart';
import 'Log/Login.dart';
import 'Profile/Chat.dart';
import 'Home/HomeScreen.dart';
import 'Profile/profile_screen.dart';
import 'Register/signup.dart';

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
        '/ChangPassword': (context) => const ChangPassword(),
        '/Chat': (context) => const ChatScreen(),
        '/verfication': (context) => verfication_screen(),
        '/verficationNumber': (context) => phoneNumberVerification(),
        '/ProfileScreen': (context) => const ProfileScreen(),
        '/v': (context) => const Verificatoin(),
        '/r': (context) => const RegisterWithPhoneNumber(),
      },
    );
  }
}
