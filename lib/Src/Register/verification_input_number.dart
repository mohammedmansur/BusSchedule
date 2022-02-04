// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:animate_do/animate_do.dart';
import 'package:bus_station/Src/Register/verfication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../Service/auth_service.dart';


class phoneNumberVerification extends StatefulWidget {
   phoneNumberVerification({Key? key,}) : super(key: key);
  @override
  _phoneNumberVerificationState createState() =>
      _phoneNumberVerificationState();
}

class _phoneNumberVerificationState extends State<phoneNumberVerification> {
  
 FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   final phoneNumberController = TextEditingController();
 String? phoneNumber = '';
  String? uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_left4,
          ),
          iconSize: 30, //size
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0, // remove shadow of appbar
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // change color of back icon

        actions: [
          SizedBox(
            // this is for shift to left
            width: 100,
            child: IconButton(
              icon: const Icon(Icons.home_rounded),
              tooltip: 'go to home',
              color: Colors.black,
              iconSize: 34,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 250, bottom: 8),
            child: Text(
              "please enter your phone No.",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 60, right: 60),
            child: TextField(
              keyboardType: TextInputType.phone,
             controller: phoneNumberController,
              decoration: InputDecoration(
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
            padding:  EdgeInsets.only(top: 40),
            child: MaterialButton(
              onPressed: () async {
               phoneNumber = phoneNumberController.text.trim();

                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: phoneNumber!,
                  verificationCompleted: (PhoneAuthCredential credential) {
                    debugPrint('verification completed');
                  },
                  verificationFailed: (FirebaseAuthException e) {
                    debugPrint('failed ${e.toString()}');
                  },
                  codeSent: (String verificationId, int? resendToken) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => verfication_screen(
                          verificationID: verificationId,
                          
                        ),
                      ),
                    );
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
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
