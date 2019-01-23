import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  SharedPreferences prefs;

  String id = '';
  String nickname = '';
  String photoUrl = '';

  @override
  void initState() {
    super.initState();
    readLocal();
  }

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id') ?? '';
    nickname = prefs.getString('nickname') ?? '';
    photoUrl = prefs.getString('photoUrl') ?? '';
    // Force refresh input
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    var stack = Column(
      //alignment: const Alignment(0.0, 0.6),
      children: [
        SizedBox(
          height: 100.0,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(photoUrl),
          radius: 100.0,
        ),
         SizedBox(
          height: 50.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            nickname,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ), 
        ),
        SizedBox(
          height: 200.0,
        ),
        Text('Much more to come'),
      ],
      
    );

    return Scaffold(
      body: Center(
        child: stack,
      ),
    );
  }
}