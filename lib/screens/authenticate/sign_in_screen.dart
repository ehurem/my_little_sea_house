import 'package:flutter/material.dart';
import 'package:my_little_sea_house/services/auth_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: Text('Sign in Anon'),
          onPressed: () async {
            dynamic result = await _authService.signInAnonimously();

            if (result == null) {
              print('Error signing in');
            } else {
              print('Signed in');
              print(result);
            }
          },
        ),
      ),
    );
  }
}
