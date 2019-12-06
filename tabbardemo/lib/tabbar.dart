import 'dart:core';

import 'package:flutter/material.dart';
import 'package:tabbardemo/home.dart';

class AppPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AppPage>
// with AutomaticKeepAliveClientMixin
{
  int _currentIndex = 0;

  final List<Widget> myTabs = [
    HomePage(),
    Home2Page(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // body: IndexedStack(
      //   index: _currentIndex,
      //   children: myTabs,
      // ),
      // body: _currentIndex == 0
      //     ? new HomePage()
      //     : _currentIndex == 1
      //         ? new HomePage()
      //         : _currentIndex == 2
      //             ? new HomePage()
      //             : _currentIndex == 3 ? new HomePage() : new HomePage(),

      // body: Container(
      //   child: Navigator(
      //     onGenerateRoute: (RouteSettings settings) {
      //       return new MaterialPageRoute(
      //         builder: (_) => myTabs[_currentIndex],
      //         settings: settings,
      //       );
      //     },
      //   ),
      // ),

      body:myTabs[_currentIndex],

      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 0),
                  blurRadius: 32.0),
            ],
          ),
          // margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: bottomNavigationBar()),
    );
  }

  Widget bottomNavigationBar() {
    bool isTabletOrIpad = MediaQuery.of(context).size.shortestSide >= 600;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(32), topLeft: Radius.circular(32)),
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            //Meeting
            BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                backgroundColor: Color(0xFF008000).withOpacity(0.1),
                radius: isTabletOrIpad ? 28 : 20,
                child: Icon(
                  Icons.group,
                  color: Color(0xFF008000),
                  size: isTabletOrIpad ? 32 : 24,
                ),
              ),
              icon: Icon(
                Icons.group,
                color: Colors.blue,
                size: isTabletOrIpad ? 32 : 24,
              ),
              title: Container(),
            ),
            //Task
            BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                radius: isTabletOrIpad ? 28 : 20,
                backgroundColor: Color(0xFFffa500).withOpacity(0.1),
                child: Icon(
                  Icons.event_note,
                  color: Color(0xFFffa500),
                  size: isTabletOrIpad ? 32 : 24,
                ),
              ),
              icon: Icon(
                Icons.event_note,
                color: Colors.blue,
                size: isTabletOrIpad ? 32 : 24,
              ),
              title: Container(),
            ),
            //Home
            // BottomNavigationBarItem(
            //   activeIcon: CircleAvatar(
            //     radius: isTabletOrIpad ? 28 : 20,
            //     backgroundColor: Color(0xFFff0000).withOpacity(0.1),
            //     child: Icon(
            //       Icons.home,
            //       color: Color(0xFFff0000),
            //       size: isTabletOrIpad ? 32 : 24,
            //     ),
            //   ),
            //   icon: Icon(
            //     Icons.home,
            //     color: Colors.blue,
            //     size: isTabletOrIpad ? 32 : 24,
            //   ),
            //   title: Container(),
            // ),
            // //Calender
            // BottomNavigationBarItem(
            //   activeIcon: CircleAvatar(
            //     radius: isTabletOrIpad ? 28 : 20,
            //     backgroundColor: Color(0xFF8b0000).withOpacity(0.1),
            //     child: Icon(
            //       Icons.date_range,
            //       color: Color(0xFF8b0000),
            //       size: isTabletOrIpad ? 32 : 24,
            //     ),
            //   ),
            //   icon: Icon(
            //     Icons.date_range,
            //     color: Colors.blue,
            //     size: isTabletOrIpad ? 32 : 24,
            //   ),
            //   title: Container(),
            // ),
            // //More
            // BottomNavigationBarItem(
            //   activeIcon: CircleAvatar(
            //     radius: isTabletOrIpad ? 28 : 20,
            //     backgroundColor: Color(0xFF0e2f44).withOpacity(0.1),
            //     child: Icon(
            //       Icons.apps,
            //       color: Color(0xFF0e2f44),
            //       size: isTabletOrIpad ? 32 : 24,
            //     ),
            //   ),
            //   icon: Icon(
            //     Icons.apps,
            //     color: Colors.blue,
            //     size: isTabletOrIpad ? 32 : 24,
            //   ),
            //   title: Container(),
            // ),
          ]),
    );
  }

  void onTabTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  // @override
  // // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => true;
}
