import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_state.dart';
import 'package:my_little_sea_house/screens/wrapper.dart';
import 'package:my_little_sea_house/widgets/circular_progress_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Wrapper(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        title: 'Pet Home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // colorScheme: const ColorScheme.dark(),
            // primarySwatch: Colors.blue,
            ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const CircularProgressIndicator();
            } else {
              return const HomeScreen();
            }
          },
        ),
        supportedLocales: const [
          Locale('en', 'US'),
          // Locale('pt', ''),
          // Locale('es', ''),
          // Locale('fa', ''),
          // Locale('fr', ''),
          // Locale('ja', ''),
          // Locale('sk', ''),
          // Locale('pl', ''),
        ],
      ),
    );
  }
}
