import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/ui/VideoDetail.dart';
import 'package:youtube_flutter_app/ui/VideoItem.dart';
import 'package:youtube_flutter_app/ui/app_bar.dart';
import 'package:youtube_flutter_app/utils/Strings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          accentColor: Colors.white,
          fontFamily: 'Raleway-Regular',
        ),
        home: new MyHomePage(title: 'Flutter Demo Home Page'),
        routes: <String, WidgetBuilder>{
          Strings.videosDetailRoute: (BuildContext context) => VideoDetail(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  var _page = 0;

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
            icon: Image.asset(
              "assets/images/home.png",
              height: 24.0,
              width: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Trending",
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
            icon: Image.asset(
              "assets/images/trending.png",
              height: 24.0,
              width: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Subscriptions",
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
            icon: Image.asset(
              "assets/images/subscriptions.png",
              height: 24.0,
              width: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Inbox",
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
            icon: Image.asset(
              "assets/images/inbox.png",
              height: 24.0,
              width: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Library",
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
            icon: Image.asset(
              "assets/images/library.png",
              height: 24.0,
              width: 24.0,
            ),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
      body: PageView(
        children: <Widget>[
          SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    elevation: 8.0,
                    flexibleSpace: Container(
                      child: AppBarWidget(),
                      height: 48.0,
                    ),
                    pinned: false,
                    backgroundColor: Colors.transparent,
                  ),
                ];
              },
              body: new ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                new VideoItem(),
                itemCount: 10,
              ),
            ),
          ),
          SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    elevation: 8.0,
                    flexibleSpace: Container(
                      child: AppBarWidget(),
                      height: 48.0,
                    ),
                    pinned: false,
                    backgroundColor: Colors.transparent,
                  ),
                ];
              },
              body: new ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                new VideoItem(),
                itemCount: 10,
              ),
            ),
          ),
          SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    elevation: 8.0,
                    flexibleSpace: Container(
                      child: AppBarWidget(),
                      height: 48.0,
                    ),
                    pinned: false,
                    backgroundColor: Colors.transparent,
                  ),
                ];
              },
              body: new ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                new VideoItem(),
                itemCount: 10,
              ),
            ),
          ),
          SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    elevation: 8.0,
                    flexibleSpace: Container(
                      child: AppBarWidget(),
                      height: 48.0,
                    ),
                    pinned: false,
                    backgroundColor: Colors.transparent,
                  ),
                ];
              },
              body: new ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                new VideoItem(),
                itemCount: 10,
              ),
            ),
          ),
          SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    elevation: 8.0,
                    flexibleSpace: Container(
                      child: AppBarWidget(),
                      height: 48.0,
                    ),
                    pinned: false,
                    backgroundColor: Colors.transparent,
                  ),
                ];
              },
              body: new ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                new VideoItem(),
                itemCount: 10,
              ),
            ),
          )
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: new NeverScrollableScrollPhysics(),
      ),
    );
  }

  ///
  /// Bottom Navigation tap listener
  ///
  void navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
