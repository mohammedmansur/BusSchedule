import 'package:bus_station/Src/Data/DataModel.dart';
import 'package:bus_station/Src/Service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

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
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Passenger")
              .where('email',
                  isEqualTo: FirebaseAuth.instance.currentUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return ListTile(onTap: () {
                Navigator.pushNamed(context, '/Login');
              });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            var docs = snapshot.data!.docs
                .map((e) => Datamodel.fromMap(e.data() as Map<String, dynamic>))
                .toList();
            return Center(
              child: ListView(
                children: [
                  SizedBox(
                    width: 100,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 4),
                          width: 150,
                          height: 150,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Image.network(
                              'https://th.bing.com/th/id/R.1300018473cc0038187aaa0e2604fa27?rik=aNeBzHZuOCnJzw&riu=http%3a%2f%2fwww.davidmonreal.com%2fwp-content%2fplugins%2fall-in-one-seo-pack%2fimages%2fdefault-user-image.png&ehk=brSt85s%2fyaaiglnl%2b2XO70sMRWv4JBEcig5c6cZya0g%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 150,
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(docs[0].email!),
                        ),
                      ],
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
                              title: Text(""),
                              leading: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                            child: ListTile(
                              title: Text(docs[0].email!),
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
            );
          }),
    );
  }
}
