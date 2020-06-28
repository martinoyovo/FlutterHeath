
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';


class Navbar extends StatefulWidget {

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
      Home(),
      Home(),
      Home()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade50,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, size: 25),
            title: Text(
                '',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.av_timer, size: 25),
            activeIcon: Column(
              children: [
                Icon(Icons.av_timer, size: 25),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                )
              ],
            ),
            title: Text(
              '',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music, size: 27),
            title: Text(
                '',
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
