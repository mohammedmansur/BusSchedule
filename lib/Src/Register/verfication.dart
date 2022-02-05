// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import "package:bus_station/Src/Register/verification_input_number.dart";

class verfication_screen extends StatefulWidget {
  verfication_screen({Key? key, verificationID}) : super(key: key);

  @override
  _verfication_screenState createState() => _verfication_screenState();
}

class _verfication_screenState extends State<verfication_screen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationID;
  String? phoneNumber = '';
  String? verificationCode;
  String? uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 40,
            )),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_left4,
          ),
          iconSize: 30,
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0, // remove shadow of appbar
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // change color of back icon
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 150),
            child: Text(
              "verfication",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          Text(
            "please enter the verification code",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: TextField(
              onChanged: (code) {
                verificationCode = code;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Verification code',
                contentPadding: const EdgeInsets.only(left: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: MaterialButton(
              onPressed: () async {
                verificationCode = verificationCode!.trim();
                PhoneAuthCredential _credential = PhoneAuthProvider.credential(
                    verificationId: verificationID!,
                    smsCode: verificationCode!);
                debugPrint('===========>before');
                UserCredential _userCredential =
                    await _auth.signInWithCredential(_credential);
                Navigator.pushNamed(context, "/Login");
              },
              height: 45,
              color: Colors.blueGrey,
              child: const Text(
                "verify",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
