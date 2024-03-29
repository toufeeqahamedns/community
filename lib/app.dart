import 'package:community/ui/screens/start.dart';
import 'package:community/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:community/ui/screens/login.dart';

class CommunityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Community',
      theme: buildTheme(),
      routes: {
        '/': (context) => StartScreen(),
        '/login': (context) => LoginScreen(),
      }
    );
  }
}