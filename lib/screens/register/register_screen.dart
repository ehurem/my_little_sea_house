import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';

import 'package:my_little_sea_house/bloc/authentication/authentication_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_event.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_state.dart';
import 'package:my_little_sea_house/bloc/register/register_bloc.dart';
import 'package:my_little_sea_house/exceptions/form_exceptions.dart';
import 'package:my_little_sea_house/screens/home/home_screen.dart';
import 'package:my_little_sea_house/widgets/custom_circular_progress_indicator_widget.dart';
import 'package:my_little_sea_house/widgets/form_error_widget.dart';
import 'package:my_little_sea_house/widgets/sucess_animation_widget.dart';
import 'dart:io';

// class RegisterScreen extends StatelessWidget {
//   RegisterScreen({Key? key}) : super(key: key);

//   final _formKey = GlobalKey<FormBuilderState>();

//   void submitForm(BuildContext context) {
//     if (_formKey.currentState?.saveAndValidate() ?? false) {
//       final data = _formKey.currentState?.value;
//       context.read<RegisterBloc>().add(
//             RegisterRequestEvent(
//               email: data!['email'],
//               password: data['password'],
//             ),
//           );
//     }
//   }

//   Future<bool> popScreen(state) async {
//     return state is! RegisterLoadingState;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthenticationBloc, AuthenticationState>(
//       builder: (context, authState) {
//         return BlocProvider(
//           create: (context) => RegisterBloc(),
//           child: BlocConsumer<RegisterBloc, RegisterState>(
//             listener: (context, state) {
//               if (state is RegisterSuccessState) {
//                 context.read<AuthenticationBloc>().add(
//                       AuthAuthenticateEvent(state.user),
//                     );
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return const SuccessDialog(
//                       title: 'Success',
//                       text: 'Your register was successful!',
//                       buttonText: 'Continue',
//                     );
//                   },
//                 );
//               }
//             },
//             builder: (context, state) {
//               return WillPopScope(
//                 onWillPop: () => popScreen(state),
//                 child: Scaffold(
//                   appBar: AppBar(
//                     title: const Text("Sign Up"),
//                     leading: IconButton(
//                       onPressed: () async {
//                         if (await popScreen(state)) {
//                           Navigator.pop(context);
//                         }
//                       },
//                       icon: const Icon(Icons.arrow_back),
//                       splashRadius: 23,
//                     ),
//                   ),
//                   body: Builder(
//                     builder: (_) {
//                       return Center(
//                         child: SingleChildScrollView(
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: FormBuilder(
//                               key: _formKey,
//                               child: Builder(builder: (context) {
//                                 if (state is RegisterErrorState) {
//                                   if (state.exception is FormFieldsException) {
//                                     for (var error in (state.exception
//                                             as FormFieldsException)
//                                         .errors
//                                         .entries) {
//                                       _formKey.currentState?.invalidateField(
//                                         name: error.key,
//                                         errorText: error.value,
//                                       );
//                                     }
//                                   }
//                                 }

//                                 return Column(
//                                   children: [
//                                     Builder(
//                                       builder: (context) {
//                                         if (state is RegisterErrorState) {
//                                           if (state.exception
//                                               is FormGeneralException) {
//                                             return Column(
//                                               children: [
//                                                 FormErrorWidget(
//                                                   (state.exception
//                                                           as FormGeneralException)
//                                                       .message,
//                                                 ),
//                                                 const SizedBox(
//                                                   height: 20,
//                                                 )
//                                               ],
//                                             );
//                                           }
//                                         }
//                                         return Container();
//                                       },
//                                     ),
//                                     // FormBuilderTextField(
//                                     //   name: 'first_name',
//                                     //   decoration: const InputDecoration(
//                                     //     border: OutlineInputBorder(),
//                                     //     labelText: 'First Name',
//                                     //   ),
//                                     //   textInputAction: TextInputAction.next,
//                                     //   validator: FormBuilderValidators.compose(
//                                     //     [
//                                     //       FormBuilderValidators.required(
//                                     //           context),
//                                     //       FormBuilderValidators.match(
//                                     //         context,
//                                     //         r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$",
//                                     //       ),
//                                     //     ],
//                                     //   ),
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 10,
//                                     // ),
//                                     // FormBuilderTextField(
//                                     //   name: 'last_name',
//                                     //   decoration: const InputDecoration(
//                                     //     border: OutlineInputBorder(),
//                                     //     labelText: 'Last Name',
//                                     //   ),
//                                     //   textInputAction: TextInputAction.next,
//                                     //   validator: FormBuilderValidators.compose(
//                                     //     [
//                                     //       FormBuilderValidators.required(
//                                     //           context),
//                                     //       FormBuilderValidators.match(
//                                     //         context,
//                                     //         r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$",
//                                     //       ),
//                                     //     ],
//                                     //   ),
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 10,
//                                     // ),
//                                     // CellphoneField(),
//                                     // const SizedBox(
//                                     //   height: 10,
//                                     // ),
//                                     FormBuilderTextField(
//                                       name: 'email',
//                                       decoration: const InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Email',
//                                       ),
//                                       textInputAction: TextInputAction.next,
//                                       validator: FormBuilderValidators.compose(
//                                         [
//                                           FormBuilderValidators.required(
//                                               context),
//                                           FormBuilderValidators.email(context),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     FormBuilderTextField(
//                                       name: 'password',
//                                       decoration: const InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Password',
//                                       ),
//                                       obscureText: true,
//                                       textInputAction: TextInputAction.done,
//                                       onSubmitted: (_) {
//                                         if (state is! UninitializedState) {
//                                           submitForm(context);
//                                         }
//                                       },
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     MaterialButton(
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .secondary,
//                                       onPressed: () {
//                                         if (state is! RegisterLoadingState) {
//                                           submitForm(context);
//                                         }
//                                       },
//                                       child: (state is RegisterLoadingState)
//                                           ? const Center(
//                                               child: SizedBox(
//                                                 height: 15,
//                                                 width: 15,
//                                                 child:
//                                                     CircularProgressIndicator(
//                                                   color: Colors.white,
//                                                   strokeWidth: 2,
//                                                 ),
//                                               ),
//                                             )
//                                           : const SizedBox(
//                                               width: double.infinity,
//                                               child: Text(
//                                                 'Register',
//                                                 textAlign: TextAlign.center,
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ),
//                                     ),
//                                   ],
//                                 );
//                               }),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isValidEmail(String value) {
    String emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(value);
  }

  bool _isValidName(String value) {
    String nameRegex = r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$";
    RegExp regExp = RegExp(nameRegex);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => RegisterBloc(),
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterErrorState) {
                Future.delayed(const Duration(milliseconds: 2500), () {
                  context.read<RegisterBloc>().add(
                        RegisterRestartEvent(),
                      );
                });
              } else if (state is RegisterSuccessState) {
                context.read<AuthenticationBloc>().add(
                      AuthAuthenticateEvent(state.user),
                    );
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Padding(
                    padding: const EdgeInsets.all(20),
                    child: (state is RegisterLoadingState)
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(
                                size.width * 0.2,
                                size.height * 0.3,
                                size.width * 0.2,
                                size.height * 0.3),
                            child: const CustomCircularProgressIndicator())
                        : (state is RegisterSuccessState)
                            ? const SuccessAnimation()
                            : Column(
                                children: [
                                  const SizedBox(height: 20),
                                  FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1400),
                                    child: Text(
                                      'Registracija',
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
                                    duration:
                                        const Duration(milliseconds: 1400),
                                    child: Text(
                                      'Potrebno nam je nekoliko Vaših podataka',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1400),
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
                                    duration:
                                        const Duration(milliseconds: 1400),
                                    delay: const Duration(milliseconds: 300),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 7.3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      width: double.infinity,
                                      height: size.width * 0.15,
                                      child: TextFormField(
                                        controller: _firstNameController,
                                        onTap: () {},
                                        onFieldSubmitted: (value) {},
                                        validator: (value) {
                                          // TO DO: Add field validation.
                                          if (value!.isEmpty) {
                                            return 'Nedostaje vrijednost.';
                                          } else {
                                            return null;
                                          }
                                        },
                                        cursorColor: Colors.black,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.info_outline,
                                            size: 30,
                                            color: _firstNameController
                                                    .text.isEmpty
                                                ? Colors.grey.shade300
                                                : Colors.grey.shade700,
                                          ),
                                          hintText: 'Ime',
                                          fillColor: Colors.black,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1400),
                                    delay: const Duration(milliseconds: 300),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 7.3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      width: double.infinity,
                                      height: size.width * 0.15,
                                      child: TextFormField(
                                        controller: _lastNameController,
                                        onTap: () {},
                                        onFieldSubmitted: (value) {},
                                        validator: (value) {
                                          // TO DO: Add field validation.
                                          if (value!.isEmpty) {
                                            return 'Nedostaje vrijednost.';
                                          } else {
                                            return null;
                                          }
                                        },
                                        cursorColor: Colors.black,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.info_outline,
                                            size: 30,
                                            color:
                                                _lastNameController.text.isEmpty
                                                    ? Colors.grey.shade300
                                                    : Colors.grey.shade700,
                                          ),
                                          hintText: 'Prezime',
                                          fillColor: Colors.black,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1400),
                                    delay: const Duration(milliseconds: 300),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 7.3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      width: double.infinity,
                                      height: size.width * 0.15,
                                      child: TextFormField(
                                        controller: _emailController,
                                        onTap: () {},
                                        onFieldSubmitted: (value) {},
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
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1400),
                                    delay: const Duration(milliseconds: 300),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 7.3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      width: double.infinity,
                                      height: size.width * 0.15,
                                      child: TextFormField(
                                        obscureText: true,
                                        controller: _passwordController,
                                        onTap: () {},
                                        onFieldSubmitted: (value) {},
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
                                            color:
                                                _passwordController.text.isEmpty
                                                    ? Colors.grey.shade300
                                                    : Colors.grey.shade700,
                                          ),
                                          hintText: 'Lozinka',
                                          fillColor: Colors.black,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1400),
                                    delay: const Duration(milliseconds: 300),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 7.3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      width: double.infinity,
                                      height: size.width * 0.15,
                                      child: TextFormField(
                                        obscureText: true,
                                        controller: _passwordController,
                                        onTap: () {},
                                        onFieldSubmitted: (value) {},
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
                                            color:
                                                _passwordController.text.isEmpty
                                                    ? Colors.grey.shade300
                                                    : Colors.grey.shade700,
                                          ),
                                          hintText: 'Ponovite lozinku',
                                          fillColor: Colors.black,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1400),
                                    delay: const Duration(milliseconds: 300),
                                    child: Container(
                                      width: double.infinity,
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 3),
                                        child: MaterialButton(
                                          onPressed: () {
                                            // TODO: Add field validations?
                                            context.read<RegisterBloc>().add(
                                                  RegisterRequestEvent(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                  ),
                                                );
                                          },
                                          color: (state is RegisterErrorState)
                                              ? Colors.red.shade400
                                              : const Color.fromARGB(
                                                  255, 95, 180, 182),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: BorderSide(
                                                  color: Colors.grey.shade300)),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                (state is RegisterErrorState)
                                                    ? Icons.warning_amber
                                                    : Icons.person_add_alt,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                              const Spacer(),
                                              Text(
                                                (state is RegisterErrorState)
                                                    ? "Neuspjela registracija"
                                                    : "Registrujte se",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1400),
                                    delay: const Duration(milliseconds: 300),
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        Text("Imate nalog?",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey.shade500)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 6),
                                          child: GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: Text(
                                              "Prijavite se",
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
            },
          ),
        );
      },
    );
  }
}
