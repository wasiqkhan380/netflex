import 'package:flutter/material.dart';
import 'package:netflix/views/screens/home.dart';
import 'package:netflix/views/screens/top_rated_screen.dart';
import 'package:netflix/views/screens/trending_screen.dart';


import '../trending.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    const HomeScreen(),
    const TopRated(),
    const TrendingScreen()
  ];

  @override
  void initState() {
    tabs = [
      const HomeScreen(),
      const  TopRated(),
      const TrendingScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.red,
      child: SafeArea(
        child: Scaffold(
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.grey,

            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 8,
            unselectedFontSize: 6,
            showUnselectedLabels: true,
            elevation: 3,
            backgroundColor: Colors.grey[300],
            selectedItemColor: Colors.red,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.slow_motion_video_outlined),
                label: 'Popular',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter_outlined),
                label: 'TopRated',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'TV',
              ),

            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
