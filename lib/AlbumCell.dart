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
//   return SizedBox(
//     width: double.infinity,
//     height: 100.0,
//     child: Card(
//       child: Padding(
//         padding: EdgeInsets.all(5.0),
//         child: Expanded(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Flexible(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: Hero(
//                     tag: "image${album.id}",
//                     child: FadeInImage.assetNetwork(
//                       placeholder: "images/no_image.png",
//                       image: album.thumbnailUrl,
//                       width: 75,
//                       height: 75,
//                     ),
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//
//                   Expanded(
//                     child:   Text(album.title),
//                   ),
//                   Expanded(
//                     child:   Text(album.title),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// @override
// Widget build(BuildContext context) {
//   return Container(
//     height: 100,
//     width: double.infinity,
//     child: Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
//       color: Colors.white,
//       child:Column(
//
//         children: <Widget>[
//           Flexible(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10.0),
//               child: Hero(
//                 tag: "image${album.id}",
//                 child: FadeInImage.assetNetwork(
//                   placeholder: "images/no_image.png",
//                   image: album.thumbnailUrl,
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(0.0),
//             child: Text(
//               album.title,
//               maxLines: 1,
//               softWrap: true,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 11.0,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ],
//       ),
//     )
//   );
// }
}
