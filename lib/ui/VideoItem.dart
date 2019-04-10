import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/ui/VideoDetail.dart';


class VideoItem extends StatelessWidget {
  VideoItem(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context);
  }

  Widget _buildTiles(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => VideoDetail(index.toString())));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: index.toString(),
                child: Stack(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Color.fromRGBO(2, 18, 37, 0.8),
                      child: FlutterLogo(
                        size: 200,
                      ),
                      elevation: 8,
                      margin: EdgeInsets.zero,
                    ),
                    Icon(
                      Icons.play_circle_outline,
                      size: 64,
                      color: Color.fromRGBO(27, 41, 58, 24),
                    )
                  ],
                  alignment: Alignment(0, 0),
                  fit: StackFit.passthrough,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 8,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            "Avengers Infinity war",
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 8,
                          ),
                          child: Text(
                            "Avengers Infinity war",
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
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
      ),
    );
  }
}
