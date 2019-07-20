import 'package:flutter/material.dart';
import 'package:xplore_mandiri/my_widget.dart';
import 'package:xplore_mandiri/navigationn/HomeScreen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text("1"),
    Text("1"),
    Text("1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:16.0),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xff041b34),),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number, color: Color(0xff041b34),),
            title: Text('Konfirmasi'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps, color: Color(0xff041b34)),
            title: Text('Apps'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xff041b34),),
            title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color(0xff041b34),
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
