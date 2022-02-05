import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      width: 100,
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage("assets/person.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 150,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text("Omer"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                            child: ListTile(
                              title: Text("+9647514490547"),
                              leading: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                            child: ListTile(
                              title: Text("omermukhtar55@gmail.com"),
                              leading: Icon(Icons.email),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                            child: ListTile(
                              title: Text("Erbil"),
                              leading: Icon(Icons.location_on),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                            child: ListTile(
                              title: Text("2000/03/01"),
                              leading: Icon(Icons.date_range),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
