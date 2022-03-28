import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_event.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_state.dart';
import 'package:my_little_sea_house/bloc/login/login_bloc.dart';
import 'package:my_little_sea_house/bloc/login/login_event.dart';
import 'package:my_little_sea_house/bloc/login/login_state.dart';
import 'package:my_little_sea_house/screens/bottom_app_bar/root_screen.dart';
import 'package:my_little_sea_house/screens/home/home_screen.dart';
import 'package:my_little_sea_house/widgets/custom_loading_bar_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isTapped = false;
  bool forgotPasswordPressed = false;

  bool _isValidEmail(String value) {
    String emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    bool invalidCredentials = false;
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                // Navigator.of(context).pushNamed('/root');
                context.read<AuthenticationBloc>().add(
                      AuthAuthenticateEvent(state.user),
                    );
              }
            },
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.1,
                          size.height * 0.1,
                          size.width * 0.1,
                          size.height * 0.1),
                      child: const CustomLoadingBar(),
                    ),
                  ),
                );
              } else if (state is LoginSuccessState) {
                return const RootScreen();
              } else {
                return SafeArea(
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          AnimatedContainer(
                            height: isTapped
                                ? size.height * 0.25
                                : size.height * 0.35,
                            width: isTapped
                                ? size.height * 0.25
                                : size.height * 0.35,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.fastOutSlowIn,
                            child: FadeInUp(
                              duration: const Duration(milliseconds: 1400),
                              child: Lottie.asset(
                                'assets/lottie/beach.json',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
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
                          const SizedBox(height: 15),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1400),
                            child: Text(
                              'Unesite podatke za pristup',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7.3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              width: double.infinity,
                              height: size.width * 0.15,
                              child: TextFormField(
                                controller: _emailController,
                                onTap: () {
                                  isTapped = true;
                                },
                                onFieldSubmitted: (value) {
                                  isTapped = false;
                                },
                                validator: (value) {
                                  // TO DO: Add field validation.
                                  if (value!.isEmpty) {
                                    return 'Nedostaje vrijednost.';
                                  } else if (!_isValidEmail(value)) {
                                    return 'Nevalidna email adresa.';
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    size: 30,
                                    color: _emailController.text.isEmpty
                                        ? Colors.grey.shade300
                                        : Colors.grey.shade700,
                                  ),
                                  hintText: 'E-mail',
                                  fillColor: Colors.black,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1400),
                            delay: const Duration(milliseconds: 300),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7.3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              width: double.infinity,
                              height: size.width * 0.15,
                              child: TextFormField(
                                obscureText: true,
                                controller: _passwordController,
                                onTap: () {
                                  isTapped = true;
                                },
                                onFieldSubmitted: (value) {
                                  isTapped = false;
                                },
                                validator: (value) {
                                  // TO DO: Add field validation.
                                  if (value!.isEmpty) {
                                    return 'Nedostaje vrijednost.';
                                  } else if (!_isValidEmail(value)) {
                                    return 'Nevalidan password.';
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.security_rounded,
                                    size: 30,
                                    color: _passwordController.text.isEmpty
                                        ? Colors.grey.shade300
                                        : Colors.grey.shade700,
                                  ),
                                  hintText: 'Lozinka',
                                  fillColor: Colors.black,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
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
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 3),
                                child: MaterialButton(
                                  onPressed:
                                      // TO DO: Setup check if credentials do not have correct format.
                                      invalidCredentials
                                          ? null
                                          : () {
                                              context.read<LoginBloc>().add(
                                                    LoginRequestEvent(
                                                      email:
                                                          _emailController.text,
                                                      password:
                                                          _passwordController
                                                              .text,
                                                    ),
                                                  );
                                            },
                                  color: (state is LoginFailureState)
                                      ? Colors.red.shade400
                                      : const Color.fromARGB(255, 95, 180, 182),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Colors.grey.shade300)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        (state is LoginFailureState)
                                            ? Icons.warning_amber
                                            : Icons.login,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      const Spacer(),
                                      Flexible(
                                        child: Text(
                                          (state is LoginFailureState)
                                              ? state.error.toString()
                                              : "Prijavi se",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize:
                                                (state is LoginFailureState)
                                                    ? 14
                                                    : 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1400),
                            delay: const Duration(milliseconds: 300),
                            child: GestureDetector(
                              // TODO : Animate clicking on forgot password link.
                              onTap: () {
                                print("Forgot password clicked");
                                setState(() {
                                  forgotPasswordPressed =
                                      !forgotPasswordPressed;
                                });
                              },
                              child: Text(
                                "Zaboravili ste lozinku?",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade900,
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
                            child: Row(
                              children: [
                                const Spacer(),
                                Text(
                                  "Nemate nalog još uvijek?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed('/register'),
                                    child: Text(
                                      "Registrujte se",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return Container();
              // return SafeArea(
              //   child: Scaffold(
              //     resizeToAvoidBottomInset: false,
              //     body: Padding(
              //       padding: const EdgeInsets.all(20),
              //       child: (state is LoginLoadingState)
              //           ? Padding(
              //               padding: EdgeInsets.fromLTRB(
              //                   size.width * 0.1,
              //                   size.height * 0.1,
              //                   size.width * 0.1,
              //                   size.height * 0.1),
              //               child: const CustomLoadingBar())
              //           : (state is LoginSuccessState)
              //               ? Builder(
              //                   builder: () => Navigator.of(context).pop())
              //               :
              //     ),
              //   ),
              // );
            },
          ),
        );
      },
    );
  }
}
