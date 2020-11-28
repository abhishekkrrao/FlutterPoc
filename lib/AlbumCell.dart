import 'package:dharmlok/service/dharmlokmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AlbumCell extends StatelessWidget {
  const AlbumCell(this.album);

  @required
  final Model album;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120.0,
      child: Card(
          color: Color(int.parse(album.color)),
        child: new Container(
          padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          height: 120.0,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: Image(
                  image: AssetImage("assets/images/"+album.thumbnailUrl),
                  width: 75.0,
                  height: 75.0,
                ),
              ),
              new Expanded(
                child: new Container(
                  padding: new EdgeInsets.only(left: 8.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Text(
                        album.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat-Medium',
                          fontSize: 16.0,
                        ),
                      ),
                      new Text(
                        album.desc,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: new TextStyle(
                            color: Colors.white60,
                            fontFamily: 'Montserrat-Medium',
                            fontSize: 14),
                      ),

                      new Text(
                        album.web,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: new TextStyle(
                            color: Colors.white60,
                            fontFamily: 'Montserrat-Medium',
                            fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
