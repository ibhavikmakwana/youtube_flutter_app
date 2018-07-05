import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/ui/app_bar.dart';
import 'package:youtube_flutter_app/ui/videos_list_widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
            icon: Icon(
              Icons.home,
              color: Colors.black54,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Trending",
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
            icon: Icon(
              Icons.hot_tub,
              color: Colors.black54,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Subscriptions",
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
            icon: Icon(
              Icons.subscriptions,
              color: Colors.black54,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Inbox",
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
            icon: Icon(
              Icons.email,
              color: Colors.black54,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Library",
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
            icon: Icon(
              Icons.folder,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            new AppBarWidget(),
            new VideosListWidget(),
          ],
        ),
      ),
    );
  }
}
