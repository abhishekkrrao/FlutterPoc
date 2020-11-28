import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final controller = PageController(viewportFraction: 0.8);

  var list = [
    {"name": "bda", "color": "Colors.lightGreen.shade300"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(

            children: <Widget>[
              SizedBox(
                width: 150,
                child: Text(
                  "Welcome to Flutter",
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat-Medium'),
                  overflow: TextOverflow.visible,
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 500,
                child: PageView(
                  controller: controller,
                  children: List.generate(
                      6,
                      (_) => Card(
                            color: Colors.lightGreen.shade600,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(206)),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Container(
                              height: 400,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image:
                                                AssetImage("assets/man.png")),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          )),
                ),
              ),
              SizedBox(height: 16),
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 6,
                  effect: WormEffect(),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
