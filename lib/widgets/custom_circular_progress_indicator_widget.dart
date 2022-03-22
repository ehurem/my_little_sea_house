import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Lottie.asset('assets/lottie/beach.json', fit: BoxFit.contain)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Učitavamo...",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
