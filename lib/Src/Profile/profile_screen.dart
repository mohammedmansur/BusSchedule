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
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
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
                              image: AssetImage("assets/pn.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        alignment: Alignment.center,
                        color: Colors.grey,
                        child: Text("Omer"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, elevation: 0),
                          onPressed: () {},
                          child: Card(
                            child: ListTile(
                              title: Text("Linked"),
                              leading: Icon(Icons.linked_camera_sharp),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, elevation: 0),
                          onPressed: () async {},
                          child: Card(
                            child: ListTile(
                              title: Text("Github"),
                              leading: Icon(Icons.cast),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, elevation: 0),
                          onPressed: () async {},
                          child: Card(
                            child: ListTile(
                              title: Text("Phone"),
                              leading: Icon(Icons.call),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, elevation: 0),
                          onPressed: () async {},
                          child: Card(
                            child: ListTile(
                              title: Text("Phone"),
                              leading: Icon(Icons.call),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, elevation: 0),
                          onPressed: () async {},
                          child: Card(
                            child: ListTile(
                              title: Text("Phone"),
                              leading: Icon(Icons.call),
                            ),
                          ),
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
