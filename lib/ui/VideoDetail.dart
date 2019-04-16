import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/state_container.dart';

class VideoDetail extends StatefulWidget {
  VideoDetail(this.index, {Key key}) : super(key: key);
  final String index;

  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail>
    with SingleTickerProviderStateMixin {
  var _giveVerse = true;
  StateContainerState container;
  Animation<double> height;
  Animation<double> width;
  bool visible = true;
  Animation<double> opacity;
  Animation<double> position;
  Animation<double> bottomPosition;
  AnimationController controller;
  double maxWidth;
  double maxHeight = 200;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    container = StateContainer.of(context);

    Widget _buildAnimation(BuildContext context, Widget child) {
      height = Tween<double>(
        begin: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        end: 75.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0,
            0.500,
            curve: Curves.easeInOutSine,
          ),
        ),
      );

      width = Tween<double>(
        begin: MediaQuery.of(context).size.width,
        end: MediaQuery.of(context).size.width / 3,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0,
            0.500,
            curve: Curves.easeInOutSine,
          ),
        ),
      );

      position = Tween<double>(
        begin: 0.0,
        end: 8.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0,
            0.500,
            curve: Curves.easeInOutSine,
          ),
        ),
      );

      bottomPosition = Tween<double>(
        begin: 0.0,
        end: 72,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0,
            0.500,
            curve: Curves.easeInOutSine,
          ),
        ),
      );

      opacity = Tween<double>(
        begin: 1.0,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          reverseCurve: Curves.easeIn,
          parent: controller,
          curve: Interval(
            0.0,
            0.200,
            curve: Curves.ease,
          ),
        ),
      );

      return Positioned(
        bottom: bottomPosition.value,
        right: position.value,
        left: position.value,
        child: Container(
          width: width.value,
          height: height.value,
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Expanded(
                child: detailVideoCardWidget(
                  MediaQuery.of(context).size.width,
                  height.value,
                  BoxConstraints(maxHeight: 200, minHeight: 75),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: AnimatedBuilder(
        builder: _buildAnimation,
        animation: controller,
      ),
    );
  }

  ///
  /// Detail Video card
  ///
  Widget detailVideoCardWidget(
      double width, double height, BoxConstraints boxConstraints) {
    return Material(
      child: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onVerticalDragEnd: (details) {
                print("Y: ${details.velocity.pixelsPerSecond.dy}");
                if (details.velocity.pixelsPerSecond.dy > 0) {
                  controller.forward();
                  setState(() {
                    visible = !visible;
                  });
                } else if (details.velocity.pixelsPerSecond.dy < 0) {
                  controller.reverse();
                  setState(() {
                    visible = !visible;
                  });
                }
              },
              child: Container(
                constraints: boxConstraints,
                width: width,
                height: height,
                child: Stack(
                  fit: StackFit.loose,
                  children: <Widget>[
                    Container(
                      width: width,
                      color: Color.fromRGBO(2, 18, 37, 0.8),
                      child: FlutterLogo(
                        size: 200,
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.play_circle_outline,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: opacity.value == 1,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: opacity.value,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    titleWidget(),
                    viewsWidget(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Divider(),
                    ),
                    optionsWidget(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Divider(),
                    ),
                    channelWidget(),
                    middleAutoPlayWidgets(),
                    Container(
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                        bottom: 8,
                      ),
                      height: 150,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          horizontalVideoList(),
                          horizontalVideoList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// title Widget
  ///
  Widget titleWidget() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 8,
        right: 8,
      ),
      child: Text(
        "Marvel Studios Avengers: Infinity War - Official Trailer",
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        maxLines: 2,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  ///
  /// Views Widget
  ///
  Widget viewsWidget() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        "83M views",
        softWrap: true,
        maxLines: 2,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  Widget optionsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.circular(64),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/thumbs_up.png",
              fit: BoxFit.cover,
              height: 24,
              width: 24,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(64),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/thumbs_down.png",
              height: 24,
              width: 24,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(64),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/share.png",
              height: 24,
              width: 24,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(64),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/download.png",
              height: 24,
              width: 24,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(64),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/add_playlist.png",
              height: 24,
              width: 24,
            ),
          ),
        ),
      ],
    );
  }

  Widget channelWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 16,
            right: 8,
            bottom: 8,
          ),
          child: CircleAvatar(
            child: FlutterLogo(),
            backgroundColor: Colors.redAccent,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Avengers Infinity war",
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Avengers Infinity war",
                softWrap: true,
                maxLines: 1,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 16),
          child: FlatButton.icon(
            icon: Icon(
              Icons.play_arrow,
              size: 16,
              color: Color.fromRGBO(231, 0, 3, 0.8),
            ),
            label: Text(
              "SUBSCRIBE",
              style: TextStyle(
                color: Color.fromRGBO(231, 0, 3, 0.8),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  ///
  /// Up next auto play widget
  ///
  Widget middleAutoPlayWidgets() {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Up next",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "Autoplay",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                activeColor: Colors.redAccent,
                value: _giveVerse,
                onChanged: (bool newValue) {
                  setState(() {
                    _giveVerse = newValue;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget horizontalVideoList() {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Color.fromRGBO(2, 18, 37, 0.8),
        child: FlutterLogo(
          size: 100,
        ),
        elevation: 8,
        margin: EdgeInsets.zero,
      ),
      height: 100,
      width: 200,
      padding: EdgeInsets.only(
        left: 8,
        right: 8,
      ),
    );
  }

  Widget commentWidget() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        child: ListView(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlutterLogo(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Add a public comment...'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget commentTextLabelWidget() {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Comments",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "256",
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
    );
  }

  Future<bool> _onWillPop() {
    if (container.selectedIndex > -1) {
      if (controller.isCompleted) {
        Navigator.of(context).pop(true);
      } else {
        controller.forward();
      }
    }
  }
}
