import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessAnimation extends StatelessWidget {
  const SuccessAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Timer(
      const Duration(milliseconds: 2500),
      () => Navigator.of(context).pushNamed('/root'),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Uskoro ćete biti prebačeni na početnu stranicu...",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
