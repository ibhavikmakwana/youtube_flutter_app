import 'package:flutter/material.dart';

class YoutubePIPAnimation extends StatefulWidget {
  YoutubePIPAnimation({
    Key key,
    this.backgroundWidget,
  })  : assert(backgroundWidget != null),
        super(key: key);

  final Widget backgroundWidget;

  @override
  _YoutubePIPAnimationState createState() => _YoutubePIPAnimationState();
}

class _YoutubePIPAnimationState extends State<YoutubePIPAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> height;
  bool visible = true;
  Animation<double> borderWidth;
  Animation<double> opacity;
  Animation<double> position;

  AnimationController controller;
  double maxWidth;
  double maxHeight = 200;
  Animation<double> bottomPosition;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
//    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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

    position = Tween<double>(
      begin: 0.0,
      end: 16.0,
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
          0.500,
          curve: Curves.ease,
        ),
      ),
    );

    borderWidth = Tween<double>(begin: 3.0, end: 7.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.500,
          curve: Curves.easeInOutSine,
        ),
      ),
    );
    return Stack(
      children: <Widget>[
        widget.backgroundWidget,
        Positioned(
          bottom: bottomPosition.value,
          right: position.value,
          left: position.value,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: height.value,
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
                    constraints: BoxConstraints(maxHeight: 200, minHeight: 75),
                    color: Colors.teal,
                    width: MediaQuery.of(context).size.width,
                    height: height.value,
                  ),
                ),
                Expanded(
                  child: Visibility(
                    maintainState: visible,
                    maintainAnimation: visible,
                    visible: visible,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class FingerScanAnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: YoutubePIPAnimation(
        backgroundWidget: getBackgroundWidget(),
      ),
    );
  }

  getBackgroundWidget() {
    return Container(
      color: Colors.white,
    );
  }
}
