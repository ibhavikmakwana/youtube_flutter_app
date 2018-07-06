import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarState createState() => new _AppBarState();
}

class _AppBarState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(top: 8.0, right: 16.0, left: 16.0),
      child: new AppBar(
        title: Row(
          children: <Widget>[
            FlutterLogo(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Youtube",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          new IconButton(
            icon: Image.asset(
              "assets/images/videocam.png",
            ),
            onPressed: () {},
          ),
          new IconButton(
            icon: Image.asset(
              "assets/images/search.png",
            ),
            onPressed: () {},
          ),
          new IconButton(
            icon: CircleAvatar(
              child: new FlutterLogo(
                size: 18.0,
              ),
              backgroundColor: Colors.red,
            ),
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
