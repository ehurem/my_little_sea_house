import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../screens/home/home_screen.dart';

class SuccessAnimation extends StatelessWidget {
  const SuccessAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(milliseconds: 2500),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen()),
      ),
    );

    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            color: Colors.transparent,
            child: Lottie.asset(
              'assets/lottie/checkmark.json',
              fit: BoxFit.cover,
              repeat: false,
            ),
          ),
          Text(
            "Registracija uspješna!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade900,
            ),
          )
        ],
      ),
    );
  }
}
