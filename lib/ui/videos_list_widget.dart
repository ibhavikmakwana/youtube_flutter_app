import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/ui/VideoItem.dart';

class VideosListWidget extends StatefulWidget {
  @override
  _VideosListWidgetState createState() => new _VideosListWidgetState();
}

class _VideosListWidgetState extends State<VideosListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new ListView.builder(
        itemBuilder: (BuildContext context, int index) => new VideoItem(),
        itemCount: 10,
      ),
    );
  }
}
