import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../Service/auth_service.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    PanelController _pc1 = PanelController();
    return AdvancedDrawer(
      backdropColor: Color.fromARGB(255, 45, 45, 45),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: false,
      rtlOpening: false,
      disabledGestures: true,
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
                    Provider.of<AuthService>(context, listen: true).theUser !=
                            null
                        ? Provider.of<AuthService>(context, listen: true)
                            .theUser!
                            .email!
                        : 'no user',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                const Divider(
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
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              setState(() {
                _pc1.open();
              });
            },
            child: const Icon(
              Icons.location_on,
              color: (Colors.black),
            ),
          ),
          body: SlidingUpPanel(
            maxHeight: 200,
            minHeight: 10,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            controller: _pc1,
            panel: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Center(
                      child: Divider(
                    color: Colors.black,
                  )),
                ],
              ),
            ),
            body: Stack(
              children: <Widget>[
                FlutterMap(
                  options: MapOptions(
                      center: LatLng(35.529779, 45.495944), zoom: 13),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/busschedule00/cl3ipmari008j14rswuhjiink/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYnVzc2NoZWR1bGUwMCIsImEiOiJjbDNpcGQweTMwMGV5M2Rxcjd4NWdyZTZkIn0.IuRAkqjJXDs1tSQ09bEJZg',
                    ),
                    PolylineLayerOptions(polylines: [
                      Polyline(
                          points: points, strokeWidth: 6, color: Colors.red),
                    ])
                  ],
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
                            value.visible
                                ? Iconsax.close_square
                                : Iconsax.menu_14,
                            size: 35,
                            key: ValueKey<bool>(value.visible),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  var points = <LatLng>[
    LatLng(35.530818, 45.496320),
    LatLng(35.530792, 45.495917),
    LatLng(35.530788, 45.495139),
    LatLng(35.530813, 45.494407),
    LatLng(35.530813, 45.494407),
    LatLng(35.531213, 45.492080),
    LatLng(35.531401, 45.491298),
    LatLng(35.531532, 45.490487),
    LatLng(35.531567, 45.489905),
    LatLng(35.531510, 45.489631),
    LatLng(35.531283, 45.489009),
    LatLng(35.530777, 45.487900),
    LatLng(35.530393, 45.487229),
    LatLng(35.530005, 45.486582),
    LatLng(35.530009, 45.486507),
    LatLng(35.529869, 45.486158),
    LatLng(35.529764, 45.485573),
    LatLng(35.529708, 45.484868),
    LatLng(35.529647, 45.483062),
    LatLng(35.529605, 45.480164),
    LatLng(35.529598, 45.478447),
    LatLng(35.529598, 45.478447),
    LatLng(35.529420, 45.476250),
    LatLng(35.529302, 45.476181),
    LatLng(35.529210, 45.476132),
    LatLng(35.529070, 45.476132),
    LatLng(35.528348, 45.477098),
    LatLng(35.528108, 45.477370),
    LatLng(35.527492, 45.474786),
    LatLng(35.527169, 45.473098),
    LatLng(35.526544, 45.471145),
    LatLng(35.525712, 45.468209),
    LatLng(35.525218, 45.466498),
    LatLng(35.524756, 45.464824),
    LatLng(35.524086, 45.462469),
    LatLng(35.525717, 45.461654),
    LatLng(35.525999, 45.461643),
    LatLng(35.526127, 45.461595),
    LatLng(35.526184, 45.461488),
    LatLng(35.530033, 45.459556),
    LatLng(35.530362, 45.459460),
    LatLng(35.530781, 45.459422),
    LatLng(35.530941, 45.459123),
    LatLng(35.531051, 45.458930),
    LatLng(35.531273, 45.458771),
    LatLng(35.534459, 45.457518),
    LatLng(35.535752, 45.456882),
    LatLng(35.536128, 45.456791),
    LatLng(35.536211, 45.456646),
    LatLng(35.536634, 45.456324),
    LatLng(35.538150, 45.454594),
    LatLng(35.538381, 45.454482),
    LatLng(35.538486, 45.454369),
    LatLng(35.538494, 45.454133),
    LatLng(35.539271, 45.453033),
    LatLng(35.539664, 45.452663),
    LatLng(35.539861, 45.452534),
    LatLng(35.539900, 45.452400),
    LatLng(35.539884, 45.452271),
    LatLng(35.541056, 45.451070),
    LatLng(35.542135, 45.449895),
    LatLng(35.542301, 45.449686),
    LatLng(35.544886, 45.447505),
    LatLng(35.545967, 45.446660),
    LatLng(35.546556, 45.446290),
    LatLng(35.547019, 45.446129),
    LatLng(35.547970, 45.445754),
    LatLng(35.548988, 45.445378),
    LatLng(35.549744, 45.445123),
    LatLng(35.550728, 45.444860),
    LatLng(35.551238, 45.444409),
    LatLng(35.551670, 45.445306),
    LatLng(35.552067, 45.446364),
    LatLng(35.552152, 45.446366),
    LatLng(35.552217, 45.446323),
    LatLng(35.551733, 45.445201),
    LatLng(35.551259, 45.444278),
    LatLng(35.552312, 45.443315),
    LatLng(35.552589, 45.443047),
    LatLng(35.552758, 45.442873),
    LatLng(35.553243, 45.442680),
    LatLng(35.554779, 45.442083),
    LatLng(35.555076, 45.441972),
    LatLng(35.555085, 45.442412),
    LatLng(35.555229, 45.442960),
    LatLng(35.555460, 45.442954),
    LatLng(35.555392, 45.442835)
  ];
}
