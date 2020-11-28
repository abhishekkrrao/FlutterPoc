import 'dart:io';
import 'dart:async';
import 'package:dharmlok/src/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Home.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final LocalStorage storage = new LocalStorage('user');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Color(int.parse("0xFF003975")),
        ),
        home: getWidget());
  }
  @protected
  @mustCallSuper
  void initState() {
    FirebaseApp app =  Firebase.initializeApp() as FirebaseApp;
    assert(app != null);
    print('Initialized default app $app');
  }
  Widget getWidget(){
    // developer.log('islogin ', name: storage.getItem('islogin'));
    stdout.writeln(storage.getItem('islogin'));
    return storage.getItem('islogin') == true ? MyHomePage() : LoginPage();
  }
}
