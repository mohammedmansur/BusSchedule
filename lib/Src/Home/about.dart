import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
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
                                  image: AssetImage("assets/pn.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey,
                            ),
                            width: 150,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "**",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.grey,
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
                            padding: EdgeInsets.all(2),
                            child: Card(
                                child: ListTile(
                                    title: Text("Omer Mukhtar Saeed"),
                                    leading: Image.asset('assets/R.jpg'))),
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
