import 'package:flutter/material.dart';
import 'package:news_app/ui/pages/favorite_page.dart';
import 'package:news_app/ui/pages/home_page.dart';
import 'package:news_app/ui/pages/sections_page.dart';

class TapScreen extends StatefulWidget {
  static const id = '/TapScreen';
  const TapScreen({Key? key}) : super(key: key);

  @override
  _TapScreenState createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  final List<Map<String, Widget>> _pages = [
    {
      'page': const HomePage(),
    },
    {
      'page': const SectionsPage(),
    },
    {
      'page': const FavoritePage(),
    },
  ];
  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: BottomNavigationBar(
          elevation: 0.9,
          selectedItemColor: const Color(0xff3FC1C0),
          iconSize: 30,
          unselectedItemColor: const Color(0xffC4D9DC),
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _selectedPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.toc),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
