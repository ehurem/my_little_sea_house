import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingBar extends StatefulWidget {
  const CustomLoadingBar({Key? key}) : super(key: key);

  @override
  State<CustomLoadingBar> createState() => _CustomLoadingBarState();
}

class _CustomLoadingBarState extends State<CustomLoadingBar> {
  late Timer _timer;
  int _index = 0;
  List<String> loadingTexts = [
    "Tražimo školjke...",
    "Popravljamo frizuru...",
    "Skačemo s mola...",
    "Gledamo jahte...",
    "Ližemo sladoled iz Oaze..."
  ];

  String loadingText = "Gledamo jahte...";

  @override
  void initState() {
    super.initState();

    // this code runs after every 2 seconds.
    _timer = Timer.periodic(
      const Duration(milliseconds: 800),
      (timer) {
        if (!mounted) return;
        setState(() {
          if (_index == 5) {
            _index = 0;
          }
          loadingText = loadingTexts[_index];
          _index++;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Pripremamo sadržaj...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade900,
            ),
          ),
          Lottie.asset('assets/lottie/beach.json', fit: BoxFit.contain),
          Text(
            loadingText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade900,
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
