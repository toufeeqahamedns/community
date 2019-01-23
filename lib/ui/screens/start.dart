import 'package:community/model/state.dart';
import 'package:community/state_widget.dart';
import 'package:community/ui/screens/forum.dart';
import 'package:community/ui/screens/home.dart';
import 'package:community/ui/screens/login.dart';
import 'package:community/ui/screens/profile.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState()  => new StartScreenState();

}  

class StartScreenState extends State<StartScreen> {

  StateModel appState;

  int _selectedIndex = 0;
  final _widgetOptions = [
    HomeScreen(),
    ForumScreen(),
    ProfileScreen()
  ];
    
      Widget _buildBottomNavigation({Widget body}) {
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
                    BottomNavigationBarItem(icon: Icon(Icons.home), title:Text('Home')),
                    BottomNavigationBarItem(icon: Icon(Icons.forum), title: Text('Forums')),
                    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
                  ],
                  currentIndex: _selectedIndex,
                  fixedColor: Colors.deepPurple,
                  onTap: _onItemTapped,
                ),
              );
      }
    
    
      Widget _buildContent() {
        if(appState.isLoading) {
          return _buildBottomNavigation(
                  body: _buildLoadingIndicator(),
                ); 
              } else if (!appState.isLoading && appState.user == null) {
                return new LoginScreen();
              } else {
                return _buildBottomNavigation(
                  //body: _buildNavigationsContent(),
                );
              }
            }
          
            Center _buildLoadingIndicator() {
              return Center(
                child: new CircularProgressIndicator(),
              );
            }
          
            @override
            Widget build(BuildContext context) {
              //Build the content depending on the state.
              appState = StateWidget.of(context).state;
              return _buildContent();  
            }
    
            void _onItemTapped(int index) {
              setState(() {
                _selectedIndex = index;
              });
            }
    }
  