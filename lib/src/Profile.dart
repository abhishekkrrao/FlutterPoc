import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'login.dart';

class Profile extends StatelessWidget{
  final LocalStorage storage = new LocalStorage('user');

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat-Medium'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                storage.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false);
              }), // here add notification icon
          // here add other icon
        ],
      ),
      body: Container(
         child: Column(
           children: [
               Container(

               ),
               Container(

               )
           ],
         ),
      ),
    );
  }

}