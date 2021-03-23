import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../pages/explore_page.dart';
import '../../pages/home_page.dart';
import '../../pages/library/library_home.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/drawer.dart';

class HomeManager extends StatefulWidget {
  @override
  _HomeManagerState createState() => _HomeManagerState();
}

class _HomeManagerState extends State<HomeManager> {
  @override
  Widget build(BuildContext context) {
    final List<Object> _pages = [
      HomePage(),
      ExplorePage(),
      LibraryHome(),
    ];
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: NavigationDrawer(),
      body: _pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(selectedPage == 0 ? Icons.home : Icons.home_outlined),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(selectedPage == 1
                  ? FontAwesomeIcons.solidCompass
                  : FontAwesomeIcons.compass),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(selectedPage == 2
                  ? Icons.my_library_music
                  : Icons.my_library_music_outlined),
              label: 'Library'),
        ],
        selectedItemColor: Colors.red,
        currentIndex: selectedPage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.grey[700],
      ),
    );
  }

  int selectedPage = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }
}
