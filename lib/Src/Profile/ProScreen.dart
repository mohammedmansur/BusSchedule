import 'package:flutter/material.dart';
import 'package:bus_station/Src/Service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:iconsax/iconsax.dart';
import 'GeneraL_Pro.dart';

class ProScreen extends StatefulWidget {
  const ProScreen({Key? key}) : super(key: key);

  @override
  _ProScreenState createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {
  late ScrollController _scrollController;

  @override
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.grey.shade900,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: const Offset(-20.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: double.infinity,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('passenger')
                          .orderBy('name')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('error');
                        } else if (!snapshot.hasData || snapshot.data == null) {
                          return Text('empty');
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return LinearProgressIndicator();
                        }

                        List<DocumentSnapshot> _docs = snapshot.data!.docs;

                        List<GeneralPro> info = _docs
                            .map((e) => GeneralPro.fromMap(
                                e.data() as Map<String, dynamic>))
                            .toList();

                        return ListView.builder(
                          itemCount: info.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(info[index].name ?? 'not name'),
                              tileColor: Colors.white,
                            );
                          },
                        );
                      })),
            ],
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color: Colors.black,
                    onPressed: _handleMenuButtonPressed,
                    icon: ValueListenableBuilder<AdvancedDrawerValue>(
                      valueListenable: _advancedDrawerController,
                      builder: (_, value, __) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: Icon(
                            value.visible
                                ? Iconsax.close_square
                                : Iconsax.personalcard,
                            key: ValueKey<bool>(value.visible),
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

//  Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Container(
//                         padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
//                         height: 60,
//                         width: double.infinity,
//                         color: Colors.white,
//                         child: Row(
//                           children: <Widget>[
//                             Expanded(
//                               child: TextField(
//                                 controller: _chatController,
//                                 decoration: InputDecoration(
//                                     hintText: name,
//                                     hintStyle: TextStyle(color: Colors.black54),
//                                     border: InputBorder.none),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 15,
//                             ),
//                             FloatingActionButton(
//                               onPressed: () async {
//                                 if (name == 'Write your name...') {
//                                   pro = _chatController.value.text;
//                                   _chatController.clear();
//                                   name = messege;
//                                   RefreshLocalizations.delegate;
//                                 } else {
//                                   await FirebaseFirestore.instance
//                                       .collection('1234')
//                                       .add({
//                                     'chat': _chatController.value.text,
//                                     'Time': Timestamp.now(),
//                                   });
//                                   _chatController.clear();
//                                 }

//                                 //     .collection('users')
//                                 //     .add({
//                                 //   'name': "wha",
//                                 //   'email': 00121212,
//                                 //   'bootCampId': "whad",
//                                 // }).catchError((e) => debugPrint(e.toString()));
//                               },
//                               child: Icon(
//                                 Icons.send,
//                                 color: Colors.white,
//                                 size: 18,
//                               ),
//                               backgroundColor: Colors.blue,
//                               elevation: 0,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),