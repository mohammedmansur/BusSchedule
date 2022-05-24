// import 'dart:async';

// import 'package:flutter/material.dart';

// import 'package:flutter/services.dart' show rootBundle;
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapWidget extends StatefulWidget {
//   const MapWidget({Key? key}) : super(key: key);

//   @override
//   State<MapWidget> createState() => MapWidgetState();
// }

// class MapWidgetState extends State<MapWidget> {
//   final Completer<GoogleMapController> _controller = Completer();
//   String? _mapStyle;

//   // @override
//   // initState() {
//   //   super.initState();
//   //   // load the map style from the asset text
//   //   rootBundle.loadString('assets/maps/style1.txt').then((string) {
//   //     _mapStyle = string;
//   //   });
//   // }

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(36.1934578323925, 43.96567824238303),
//     zoom: 40.4746,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//           controller.setMapStyle(_mapStyle); // change the map style
//         },
//       ),
//     );
//   }
// }






// // Container(
// //           child: Column(
// //             children: [
// //               const SizedBox(
// //                 height: 50,
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
//                   // IconButton(
//                   //   color: Colors.black,
//                   //   onPressed: _handleMenuButtonPressed,
//                   //   icon: ValueListenableBuilder<AdvancedDrawerValue>(
//                   //     valueListenable: _advancedDrawerController,
//                   //     builder: (_, value, __) {
//                   //       return AnimatedSwitcher(
//                   //         duration: const Duration(milliseconds: 250),
//                   //         child: Icon(
//                   //           value.visible ? Iconsax.close_square : Iconsax.menu,
//                   //           key: ValueKey<bool>(value.visible),
//                   //         ),
//                   //       );
//                   //     },
//                   //   ),
//                   // ),
// //                   IconButton(
// //                       onPressed: () {}, icon: const Icon(Iconsax.notification))
// //                 ],
// //               ),
// //               Expanded(
// //                 child: GoogleMap(
// //                   mapType: MapType.normal,
// //                   initialCameraPosition: _kGooglePlex,
// //                   onMapCreated: (GoogleMapController controller) {
// //                     _controller.complete(controller);
// //                     controller.setMapStyle(_mapStyle); // change the map style
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),