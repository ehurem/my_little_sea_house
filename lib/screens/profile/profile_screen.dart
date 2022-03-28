import 'package:animate_do/animate_do.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.07, vertical: size.height * 0.04),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const Text(
                'Postavke',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                child: const Icon(
                  FontAwesomeIcons.pen,
                  color: Color.fromARGB(255, 32, 128, 129),
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.orangeAccent,
                  ),
                  // TO DO: Use real image here
                  child: Image.asset("assets/images/beach_house.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TO DO: Use name here
                      Text(
                        (DateTime.now().hour < 12)
                            ? 'Dobro jutro,'
                            : (DateTime.now().hour > 12 &&
                                    DateTime.now().hour < 19)
                                ? 'Dobar dan,'
                                : 'Dobra večer,',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'Emir Hurem',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            delay: const Duration(milliseconds: 300),
            child: Container(
              padding: EdgeInsets.only(bottom: size.height * 0.01),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.addressCard,
                        color: Color.fromARGB(255, 32, 128, 129),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Text(
                        "Ime",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Flexible(
                    child: Text(
                      "Emir",
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            delay: const Duration(milliseconds: 300),
            child: Container(
              padding: EdgeInsets.only(bottom: size.height * 0.01),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.addressCard,
                        color: Color.fromARGB(255, 32, 128, 129),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Text(
                        "Prezime",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Flexible(
                    child: Text(
                      "Hurem",
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            delay: const Duration(milliseconds: 300),
            child: Container(
              padding: EdgeInsets.only(bottom: size.height * 0.01),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.phoneVolume,
                        color: Color.fromARGB(255, 32, 128, 129),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Text(
                        "Broj telefona",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "+387624245331097",
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            delay: const Duration(milliseconds: 300),
            child: Container(
              padding: EdgeInsets.only(bottom: size.height * 0.01),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.solidBell,
                        color: Color.fromARGB(255, 32, 128, 129),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Text(
                        "Notifikacije",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "Uključene",
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            delay: const Duration(milliseconds: 300),
            child: Container(
              padding: EdgeInsets.only(bottom: size.height * 0.01),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.moneyBill,
                        color: Color.fromARGB(255, 32, 128, 129),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Text(
                        "Valuta",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "BAM",
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            delay: const Duration(milliseconds: 300),
            child: Container(
              padding: EdgeInsets.only(bottom: size.height * 0.005),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.moon,
                        color: Color.fromARGB(255, 32, 128, 129),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Text(
                        "Način rada",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: size.height * 0.06,
                    width: size.width * 0.18,
                    child: DayNightSwitcher(
                      isDarkModeEnabled: false,
                      onStateChanged: (isDarkModeEnabled) {
                        setState(() {
                          // TO DO: Add themes and bloc
                          //this.isDarkModeEnabled = isDarkModeEnabled;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
