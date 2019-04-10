import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/ui/VideoItem.dart';
import 'package:youtube_flutter_app/ui/rounded_floating_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  var _page = 0;
  static const int _redPrimaryValue = 0xFFF44336;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          buildBottomNavigationBarItem(
              "Home", "assets/images/outline-home-24px.svg"),
          buildBottomNavigationBarItem(
              "Trending", "assets/images/outline-trending_up-24px.svg"),
          buildBottomNavigationBarItem(
              "Subscriptions", "assets/images/outline-subscriptions-24px.svg"),
          buildBottomNavigationBarItem(
              "Inbox", "assets/images/outline-inbox-24px.svg"),
          buildBottomNavigationBarItem(
              "Library", "assets/images/outline-video_library-24px.svg"),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, isInnerBoxScroll) => [
              RoundedFloatingAppBar(
                actions: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/outline-videocam-24px.svg",
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/outline-search-24px.svg",
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: CircleAvatar(
                      child: FlutterLogo(
                        size: 18,
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
                floating: true,
                snap: true,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlutterLogo(
                      colors: MaterialColor(
                        _redPrimaryValue,
                        <int, Color>{
                          50: Color(0xFFFFEBEE),
                          100: Color(0xFFFFCDD2),
                          200: Color(0xFFEF9A9A),
                          300: Color(0xFFE57373),
                          400: Color(0xFFEF5350),
                          500: Color(_redPrimaryValue),
                          600: Color(0xFFE53935),
                          700: Color(0xFFD32F2F),
                          800: Color(0xFFC62828),
                          900: Color(0xFFB71C1C),
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Youtube",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
              ),
            ],
        body: PageView(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  VideoItem(index),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  VideoItem(index),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  VideoItem(index),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  VideoItem(index),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  VideoItem(index),
              itemCount: 10,
            )
          ],
          controller: _pageController,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String title, String assetIconPath) {
    return BottomNavigationBarItem(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 11,
        ),
      ),
      activeIcon: SvgPicture.asset(
        assetIconPath,
        color: Colors.red,
      ),
      icon: SvgPicture.asset(
        assetIconPath,
        color: Colors.black,
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
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
