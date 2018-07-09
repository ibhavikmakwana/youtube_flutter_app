import 'package:flutter/material.dart';

class VideoDetail extends StatefulWidget {
  VideoDetail({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VideoDetailState createState() => new _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          detailVideoCardWidget(),
        ],
      )),
    );
  }

  ///
  /// Detail Video card
  ///
  Widget detailVideoCardWidget() {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: FlutterLogo(
              size: 200.0,
            ),
            elevation: 8.0,
            margin: EdgeInsets.zero,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              titleWidget(),
              viewsWidget(),
              optionsWidget(),
            ],
          ),
        ],
      ),
    );
  }

  ///
  /// title Widget
  ///
  Widget titleWidget() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Text(
        "Marvel Studios Avengers: Infinity War - Official Trailer",
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        maxLines: 2,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }

  ///
  /// Views Widget
  ///
  Widget viewsWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "83M views",
        softWrap: true,
        maxLines: 2,
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }

  Widget optionsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.circular(64.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Image.asset(
              "assets/images/thumbs_up.png",
              fit: BoxFit.cover,
              height: 24.0,
              width: 24.0,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(64.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Image.asset(
              "assets/images/thumbs_down.png",
              height: 24.0,
              width: 24.0,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(64.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Image.asset(
              "assets/images/share.png",
              height: 24.0,
              width: 24.0,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(64.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Image.asset(
              "assets/images/download.png",
              height: 24.0,
              width: 24.0,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(64.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Image.asset(
              "assets/images/add_playlist.png",
              height: 24.0,
              width: 24.0,
            ),
          ),
        ),
      ],
    );
  }
}
