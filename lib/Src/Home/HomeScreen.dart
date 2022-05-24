import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../Service/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  final _advancedDrawerController = AdvancedDrawerController();

  final Completer<GoogleMapController> _controller = Completer();
  String? _mapStyle;
  static const CameraPosition _kGooglePlex = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(36.1934578323925, 43.96567824238303),
    tilt: 59.440717697143555,
    zoom: 40.4746,
  );

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Color.fromARGB(255, 45, 45, 45),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: false,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: const Offset(-20.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      drawer: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100.0,
                    height: 100.0,
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 20.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                        'https://th.bing.com/th/id/R.1300018473cc0038187aaa0e2604fa27?rik=aNeBzHZuOCnJzw&riu=http%3a%2f%2fwww.davidmonreal.com%2fwp-content%2fplugins%2fall-in-one-seo-pack%2fimages%2fdefault-user-image.png&ehk=brSt85s%2fyaaiglnl%2b2XO70sMRWv4JBEcig5c6cZya0g%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1')),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    // Provider.of<AuthService>(context, listen: true).theUser !=
                    //         null
                    //     ? Provider.of<AuthService>(context, listen: true)
                    //         .theUser!
                    //         .email!
                    //     : 'no user',
                    FirebaseAuth.instance.currentUser!.email!,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                Divider(
                  thickness: 2,
                  indent: 20,
                  height: 3,
                  endIndent: 2,
                  color: Colors.white54,
                ),
                const Spacer(
                  flex: 3,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/ProfileScreen');
                  },
                  leading: const Icon(
                    Iconsax.personalcard,
                    size: 25,
                  ),
                  title: const Text('Profile'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/AboutUs');
                  },
                  leading: const Icon(Iconsax.book),
                  title: const Text('About us'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/verficationNumber');
                  },
                  leading: const Icon(Iconsax.profile_2user),
                  title: const Text('Contacts'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/v');
                  },
                  leading: const Icon(Iconsax.setting_2),
                  title: const Text('Settings'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/r');
                  },
                  leading: const Icon(Iconsax.support),
                  title: const Text('Support'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/MapWidget');
                  },
                  leading: const Icon(Iconsax.support),
                  title: const Text('Map'),
                ),
                Spacer(
                  flex: 5,
                ),
                Divider(
                  thickness: 2,
                  indent: 20,
                  height: 3,
                  endIndent: 2,
                  color: Colors.white54,
                ),
                Provider.of<AuthService>(context, listen: true).theUser != null
                    ? ListTile(
                        onTap: () {
                          Provider.of<AuthService>(context, listen: false)
                              .logOut();
                        },
                        leading: const Icon(Iconsax.logout),
                        title: const Text('SignOut'),
                      )
                    : ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/Login');
                        },
                        leading: const Icon(Iconsax.login),
                        title: const Text(
                          'SignIn',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Version 1.0.0',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  controller.setMapStyle(_mapStyle); // change the map style
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 55,
                  left: 5,
                ),
                child: IconButton(
                  color: Colors.black,
                  onPressed: _handleMenuButtonPressed,
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Icon(
                          value.visible ? Iconsax.close_square : Iconsax.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
