import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusyantek/pages/dashboard.page.dart';
import 'package:pusyantek/pages/list.page.dart';
import 'package:pusyantek/pages/kasub.page.dart';
import 'package:pusyantek/provider/auth.provider.dart';

class HomePage extends StatefulWidget {
  static final routeName = '/home';

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
      'page': KasubScreen(),
      'title': 'Kasubid',
    },
    {
      'page': ListScreen(),
      'title': 'List Kasubid',
    },
  ];

  int _selectedPageIndex = 0;

  Future<void> _selectPage(int index) async {
    if (index == 3) {
      await Provider.of<Auth>(context).logout();
      Navigator.of(context).pushReplacementNamed("/login");
    }

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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.supervisor_account),
            title: Text('Kasubid'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.list),
            title: Text('List Kasubid'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.input),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
