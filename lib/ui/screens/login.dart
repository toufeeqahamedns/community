import 'package:community/ui/widgets/google_signin_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Text _buildText() {
      return Text(
        'Community',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            _buildText(),

            SizedBox(height: 50.0),
            GoogleSignInButton(
              onPressed: () => 
              Navigator.of(context).pushReplacementNamed('/'),
            ), 
          ],
        ),
      ),
    );
  }
}