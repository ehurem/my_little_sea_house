import 'package:flutter/material.dart';
import 'package:my_little_sea_house/screens/authenticate/sign_in_screen.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({Key? key}) : super(key: key);

  @override
  __AuthenticateScreenState createState() => __AuthenticateScreenState();
}

class __AuthenticateScreenState extends State<AuthenticateScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignInScreen(),
    );
  }
}
