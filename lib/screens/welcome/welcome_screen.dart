import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_event.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_state.dart';
import 'package:my_little_sea_house/screens/home/home_screen.dart';
import 'package:my_little_sea_house/screens/login/login_screen,.dart';
import 'package:my_little_sea_house/screens/register/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   actions: [
            //     (state is AuthAuthenticatedState)
            //         ? IconButton(
            //             onPressed: () {
            //               context
            //                   .read<AuthenticationBloc>()
            //                   .add(AuthLogoutEvent());
            //             },
            //             icon: const Icon(
            //               Icons.logout,
            //             ),
            //           )
            //         : IconButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => LoginScreen()),
            //               );
            //             },
            //             icon: const Icon(
            //               Icons.login,
            //             ),
            //           ),
            //   ],
            // ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: (state is AuthAuthenticatedState)
                  ? HomeScreen()
                  : Column(
                      children: [
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Lottie.asset(
                            'assets/lottie/beach.json',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 50),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Text(
                            'My Little Sea House',
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'Allura',
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Text(
                            'Olakšano upravljanje',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          delay: const Duration(milliseconds: 200),
                          child: Container(
                            height: 5,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          delay: const Duration(milliseconds: 300),
                          child: Container(
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side:
                                      BorderSide(color: Colors.grey.shade300)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.verified_user_sharp,
                                    size: 30,
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Imaš račun? Nastavi sa prijavom',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade800),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          delay: const Duration(milliseconds: 300),
                          child: Container(
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              color: Color.fromARGB(255, 95, 180, 182),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side:
                                      BorderSide(color: Colors.grey.shade300)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(
                                    Icons.person_add_alt_sharp,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  Spacer(),
                                  Text(
                                    'Registruj se sa e-mailom',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}


// (state is AuthAuthenticatedState)