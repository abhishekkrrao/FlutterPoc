import 'dart:async';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dharmlok/service/dharmlokmodel.dart';
import 'package:dharmlok/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:localstorage/localstorage.dart';
import '../AlbumCell.dart';
import '../SlderCell.dart';
import '../details.dart';
import 'login.dart';

class DashBoard extends StatelessWidget {
  List<String> imageList = [
    "assets/slider/1.jpg",
    "assets/slider/2.jpg",
    "assets/slider/3.jpg",
    "assets/slider/4.jpg",
    "assets/slider/5.jpg"
  ];
  int _current = 0;
  StreamController<int> streamController = new StreamController<int>();
  final LocalStorage storage = new LocalStorage('user');

  List<Widget> getPageList(List<String> image) {
    var listView = List<Widget>();
    List.generate(
        image.length, (index) => {listView.add(SlderCell(image[index]))});
    return listView;
  }

  goToDetailsPage(BuildContext context, Model album) {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (BuildContext context) => TestPage()));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GridDetails(album)));
  }

  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  gridview(AsyncSnapshot<List<Model>> snapshot) {
    return Scaffold(
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 2075),
              child: SlideAnimation(
                verticalOffset: 350.0,
                child: FadeInAnimation(
                  child: GestureDetector(
                    child: AlbumCell(snapshot.data[index]),
                    onTap: () {
                      goToDetailsPage(context, snapshot.data[index]);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
                height: 110.0,
                aspectRatio: 16 / 9,
                viewportFraction: 1.1,
                initialPage: 0,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (pos, op) {
                  _current = pos;
                  print("${_current}");
                }),
            items: getPageList(imageList),
          ),
          Flexible(
            child: FutureBuilder<List<Model>>(
              future: Services.getJson(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  streamController.sink.add(snapshot.data.length);
                  return gridview(snapshot);
                }
                return circularProgress();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
  }
}
