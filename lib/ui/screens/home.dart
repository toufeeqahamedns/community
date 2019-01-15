import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int _selectedIndex = 0;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Forums'),
    Text('Index 2: Profile')
  ];

  @override
  Widget build(BuildContext context) {

    double _iconSize = 20.0;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title: Text('Community'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.forum), title: Text('Forum')),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Person')),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.deepPurple,
          
        ),
    );

    
  }
  
}