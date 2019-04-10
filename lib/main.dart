import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/home_page.dart';
import 'package:youtube_flutter_app/ui/VideoDetail.dart';
import 'package:youtube_flutter_app/ui/VideoItem.dart';
import 'package:youtube_flutter_app/utils/Strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter YouTube',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.white,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'WorkSans-Regular',
      ),
      home: MyHomePage(),
    );
  }
}
