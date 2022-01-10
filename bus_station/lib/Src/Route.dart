import 'package:flutter/material.dart';
import 'Log/Login.dart';
import 'Home/Home.dart';

class Routing extends StatelessWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/LoginPage': (context) => const LoginPage(),
      },
    );
  }
}
