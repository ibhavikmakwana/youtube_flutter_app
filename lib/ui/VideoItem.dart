import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildTiles(context);
  }

  Widget _buildTiles(BuildContext context) {
    return new ListTile(
      title: Card(
        margin: EdgeInsets.zero,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Color.fromRGBO(2, 18, 37, 0.8),
                  child: FlutterLogo(
                    size: 200.0,
                  ),
                  elevation: 8.0,
                  margin: EdgeInsets.zero,
                ),
                Icon(
                  Icons.play_circle_outline,
                  size: 64.0,
                  color: Color.fromRGBO(27, 41, 58, 24.0),
                )
              ],
              alignment: Alignment(0.0, 0.0),
              fit: StackFit.passthrough,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 8.0,
                    right: 8.0,
                    bottom: 8.0,
                  ),
                  child: CircleAvatar(
                    child: new FlutterLogo(),
                    backgroundColor: Colors.redAccent,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Text(
                          "Avengers Infinity war",
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          "Avengers Infinity war",
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/Video Detail");
      },
    );
  }
}
