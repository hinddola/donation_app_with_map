import 'package:donation_app_with_map/consts/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {

  final areaNumController = TextEditingController();
  final flatNumController = TextEditingController();
  final specialMarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  decoration: K.boxDecoration,
                  height: 450,
                  child: GoogleMap(
                    gestureRecognizers: Set()
                      ..add(Factory<PanGestureRecognizer>(
                              () => PanGestureRecognizer()))
                      ..add(Factory<ScaleGestureRecognizer>(
                              () => ScaleGestureRecognizer()))
                      ..add(Factory<TapGestureRecognizer>(
                              () => TapGestureRecognizer()))
                      ..add(Factory<
                          VerticalDragGestureRecognizer>(
                              () =>
                              VerticalDragGestureRecognizer())),
                    mapType: MapType.normal,
                    zoomControlsEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomGesturesEnabled: true,
                    mapToolbarEnabled: true,
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(37.43296265331129, -122.08832357078792),
                        zoom: 15),
                    onMapCreated: (GoogleMapController
                    gcontroller) async {    },
                    onTap: (LatLng loc) {
                      print(
                          '${loc.latitude}, ${loc.longitude}');

                    },
                  ),
            ),
                K.sizedBoxH,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // decoration: K.boxDecoration,
                        //margin: EdgeInsets.all(10),
                        height: 50,
                        child: TextFormField(
                          controller: areaNumController,
                          decoration:  InputDecoration(
                            hintText: ' رقم المنطقة',
                            hintStyle: const TextStyle(
                              color: K.black26Color ,
                            ) ,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black12)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: K.primaryColor)
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black12)
                            ),
                          ),

                        ),
                      ),
                    ),
                    K.sizedBoxW,
                    Expanded(
                      child: Container(
                        // decoration: K.boxDecoration,
                        //margin: EdgeInsets.all(10),
                        height: 50,
                        child: TextFormField(
                          controller: flatNumController,
                          decoration:  InputDecoration(
                            hintText: ' رقم الشقة ',
                            hintStyle: const TextStyle(
                              color: K.black26Color ,
                            ) ,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black12)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: K.primaryColor)
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black12)
                            ),
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
                K.sizedBoxH,
                Container(
                  // decoration: K.boxDecoration,
                  //margin: EdgeInsets.all(10),
                  height: 50,
                  child: TextFormField(
                    controller: specialMarkController,
                    decoration:  InputDecoration(
                      hintText: ' علامة مميزة ',
                      hintStyle: const TextStyle(
                        color: K.black26Color ,
                      ) ,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: K.primaryColor)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12)
                      ),
                    ),

                  ),
                ),
                K.sizedBoxH,
                K.sizedBoxH,
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text(
                      'تأكيد العنوان',
                      style: TextStyle(
                          color: K.wightColor
                      ),
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          K.primaryColor
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
