import 'package:flutter/material.dart';
import 'package:my_little_sea_house/screens/authenticate/authenticate_screen.dart';
import 'package:my_little_sea_house/screens/home/home_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Home or Authenticate widget
    return AuthenticateScreen();
  }
}
