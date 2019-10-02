import 'package:flutter/material.dart';
import 'package:pusyantek/pages/dashboard.page.dart';
import 'package:pusyantek/pages/list.page.dart';
import 'package:pusyantek/pages/pemasyarakatan.page.dart';
import 'package:pusyantek/pages/perencanaan.page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, Object>> _pages = [
    {
      'page': DashboardScreen(),
      'title': 'Dashboard',
    },
    {
      'page': PerencanaanScreen(),
      'title': 'Kasub',
    },
    {
      'page': PemasyarakatanScreen(),
      'title': 'Kasub',
    },
    {
      'page': ListScreen(),
      'title': 'List Kegiatan',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home),
            title: Text('home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.description),
            title: Text('perencanaan'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.supervisor_account),
            title: Text('pemasyarakatan'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.list),
            title: Text('list'),
          ),
        ],
      ),
    );
  }
}
