import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Colors.blueGrey,
              ),
            )
          ],
          leading: GestureDetector(
            onTap: () {/* Write listener code here */},
            child: Icon(
              Icons.menu, color: Colors.blueGrey, // add custom icons also
            ),
          ),
          // The search area here
          title: Center(
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search_rounded),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              /* Clear the search field */
                            },
                          ),
                          hintText: 'find your location here...',
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          )),

      //bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }
}
