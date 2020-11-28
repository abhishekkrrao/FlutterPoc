import 'dart:async';
import 'package:dharmlok/src/dashboard.dart';
import 'package:dharmlok/src/gallary.dart';
import 'package:dharmlok/src/login.dart';
import 'package:dharmlok/src/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();
  final String title = "";
  @override
  HomePageState createState() => HomePageState();
}

@override
void initState() {
  initializeDefault();
}

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp();
  assert(app != null);
  print('Initialized default app $app');
}

class HomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController = new PageController();
  final LocalStorage storage = new LocalStorage('user');
  final List<Widget> _children = [
    DashBoard(),
    GallaryPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    var imgList;
    return Scaffold(

      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children:_children,
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(title: Text('Home',style: TextStyle(fontSize: 12,fontFamily: 'Montserrat-Medium',),), icon: Icon(Icons.home)),
          BottomNavyBarItem(title: Text('Gallary',style: TextStyle(fontSize: 12,fontFamily: 'Montserrat-Medium',)), icon: Icon(Icons.apps)),
          BottomNavyBarItem(title: Text('Setting',style: TextStyle(fontSize: 12,fontFamily: 'Montserrat-Medium',)), icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
