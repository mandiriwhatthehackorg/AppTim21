import 'package:flutter/material.dart';
import 'package:xplore_mandiri/my_widget.dart';
import 'package:xplore_mandiri/navigationn/HomeScreen.dart';
import 'package:xplore_mandiri/navigationn/promo_tab.dart';

class NavigationScreen extends StatefulWidget {
  bool etb;

  NavigationScreen({this.etb = false});
  @override
  _NavigationScreenState createState() => _NavigationScreenState(etb);
}

class _NavigationScreenState extends State<NavigationScreen> {

  bool etb;
  _NavigationScreenState(this.etb);
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    PromoTab(),
    Text("1"),
  ];

  @override
  void initState() {
    _widgetOptions = <Widget>[
      HomeScreen(etb: etb,),
      PromoTab(),
      Text("1"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:16.0),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: !etb?BottomNavigationBar(
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
            icon: Icon(Icons.person, color: Color(0xff041b34),),
            title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color(0xff041b34),
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ):BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xff041b34),),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number, color: Color(0xff041b34),),
            title: Text('Promo'),
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
