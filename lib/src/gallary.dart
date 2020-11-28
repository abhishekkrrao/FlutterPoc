import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:localstorage/localstorage.dart';

import 'login.dart';

class GallaryPage extends StatelessWidget {
  final LocalStorage storage = new LocalStorage('user');
  @override
  Widget build(BuildContext context) {
    int columnCount = 3;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gallary",
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
      body: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            10,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: columnCount,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  height: 96,
                                  width: 96,
                                  image: AssetImage("1.png"),
                                ),
                                Text(
                                  "Abhishek ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat-Medium',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
