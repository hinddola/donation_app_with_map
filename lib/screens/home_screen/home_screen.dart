import 'package:donation_app_with_map/consts/style.dart';
import 'package:donation_app_with_map/screens/follow_your_order_screen/follow_your_order_screen.dart';
import 'package:donation_app_with_map/screens/main_screen/main_screen.dart';
import 'package:donation_app_with_map/screens/map_screen/map_screen.dart';
import 'package:donation_app_with_map/screens/phone_screen/phone_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenttIndex = 1;

  List <Widget> screens = [
    PhoneScreen(),
    MainScreen(),
    FollowYourOrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar : BottomNavigationBar(
        selectedItemColor: K.primaryColor,
        currentIndex: currenttIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
                Icons.phone_in_talk_outlined
            ),
            label: 'الهاتف',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.house_outlined
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.location_on
              ),
              label: 'تتبع الطلب'
          ),
        ],
        onTap: (index){
          setState(() {
            currenttIndex = index ;
          });
        },
      ),
      body: screens.elementAt(currenttIndex),
    );
  }
}

