import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_event.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_state.dart';
import 'package:my_little_sea_house/bloc/login/login_bloc.dart';
import 'package:my_little_sea_house/bloc/login/login_event.dart';
import 'package:my_little_sea_house/bloc/login/login_state.dart';
import 'package:my_little_sea_house/exceptions/form_exceptions.dart';
import 'package:my_little_sea_house/screens/register/register_screen.dart';
import 'package:my_little_sea_house/widgets/form_error_widget.dart';
import 'package:my_little_sea_house/widgets/sucess_dialog_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, authState) {
      return BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              context.read<AuthenticationBloc>().add(
                    AuthAuthenticateEvent(state.user),
                  );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SuccessDialog(
                    title: 'Success',
                    text: 'Your login was successful!',
                    buttonText: 'Continue',
                  );
                },
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                body: Container(
                  width: double.infinity,
                  height: size.height,
                  child: Stack(
                    children: [
                      FadeInLeft(
                        duration: const Duration(milliseconds: 1400),
                        child: Image.asset(
                          "assets/images/main_top.png",
                          width: size.width * 0.3,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, -0.3),
                        child: Container(
                          color: Colors.transparent,
                          height: size.height * 0.6,
                          width: double.infinity,
                          child: Column(
                            children: [
                              FadeInUp(
                                duration: const Duration(milliseconds: 1400),
                                child: Text(
                                  'Prijavi se na aplikaciju',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                              ),
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
                              // FadeInUp(
                              //   duration: const Duration(milliseconds: 1400),
                              //   delay: const Duration(milliseconds: 200),
                              //   child: Image.asset(
                              //     "assets/images/beach_house.png",
                              //     height: size.height * 0.25,
                              //     fit: BoxFit.contain,
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Flex(direction: Axis.vertical, children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: FadeInRight(
                              duration: const Duration(milliseconds: 1400),
                              child: Image.asset(
                                "assets/images/login_bottom.png",
                                width: size.width * 0.4,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   final _formKey = GlobalKey<FormBuilderState>();

//   void submitForm(BuildContext context) {
//     if (_formKey.currentState?.saveAndValidate() ?? false) {
//       final data = _formKey.currentState?.value;
//       context.read<LoginBloc>().add(
//             LoginRequestEvent(
//               email: data!['email'],
//               password: data['password'],
//             ),
//           );
//     }
//   }

//   Future<bool> popScreen(state) async {
//     return state is! LoginLoadingState;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthenticationBloc, AuthenticationState>(
//       builder: (context, authState) {
//         return BlocProvider(
//           create: (context) => LoginBloc(),
//           child: BlocConsumer<LoginBloc, LoginState>(
//             listener: (context, state) {
//               if (state is LoginSuccessState) {
//                 context.read<AuthenticationBloc>().add(
//                       AuthAuthenticateEvent(state.user),
//                     );
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return const SuccessDialog(
//                       title: 'Success',
//                       text: 'Your login was successful!',
//                       buttonText: 'Continue',
//                     );
//                   },
//                 );
//               }
//             },
//             builder: (context, state) {
//               return SafeArea(
//                 child: Scaffold(
//                   body: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: (),),
//                 ),)
              
              
              
//               WillPopScope(
//                 onWillPop: () => popScreen(state),
//                 child: Scaffold(
//                   appBar: AppBar(
//                     title: const Text("Login"),
//                     leading: IconButton(
//                       onPressed: () async {
//                         if (await popScreen(state)) {
//                           Navigator.pop(context);
//                         }
//                       },
//                       icon: const Icon(Icons.arrow_back),
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
//                                 if (state is LoginFailureState) {
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
//                                     Builder(builder: (context) {
//                                       if (state is LoginFailureState) {
//                                         if (state.exception
//                                             is FormGeneralException) {
//                                           return Column(
//                                             children: [
//                                               FormErrorWidget(
//                                                 (state.exception
//                                                         as FormGeneralException)
//                                                     .message,
//                                               ),
//                                               const SizedBox(
//                                                 height: 20,
//                                               )
//                                             ],
//                                           );
//                                         }
//                                       }
//                                       return Container();
//                                     }),
//                                     FormBuilderTextField(
//                                       name: 'email',
//                                       decoration: const InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Email',
//                                       ),
//                                       textInputAction: TextInputAction.next,
//                                       validator: FormBuilderValidators.compose([
//                                         FormBuilderValidators.required(context),
//                                         FormBuilderValidators.email(context),
//                                       ]),
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
//                                         if (state is! LoginLoadingState) {
//                                           submitForm(context);
//                                         }
//                                       },
//                                       child: (state is LoginLoadingState)
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
//                                                 'Login',
//                                                 textAlign: TextAlign.center,
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ),
//                                     ),
//                                     OutlinedButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 RegisterScreen(),
//                                           ),
//                                         );
//                                       },
//                                       child: const SizedBox(
//                                         width: double.infinity,
//                                         child: Text(
//                                           'Sign Up',
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
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
