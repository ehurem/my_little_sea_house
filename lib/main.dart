import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_event.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_state.dart';
import 'package:my_little_sea_house/screens/home/home_screen.dart';
import 'package:my_little_sea_house/widgets/custom_circular_progress_indicator_widget.dart';

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

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AuthenticationBloc(),
//       child: MaterialApp(
//         title: 'Pet Home',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//             // colorScheme: const ColorScheme.dark(),
//             // primarySwatch: Colors.blue,
//             ),
//         home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
//           builder: (context, state) {
//             if (state is UninitializedState) {
//               return const CustomCircularProgressIndicator();
//             } else {
//               return const HomeScreen();
//             }
//           },
//         ),
//         supportedLocales: const [
//           Locale('en', 'US'),
//           // Locale('pt', ''),
//           // Locale('es', ''),
//           // Locale('fa', ''),
//           // Locale('fr', ''),
//           // Locale('ja', ''),
//           // Locale('sk', ''),
//           // Locale('pl', ''),
//         ],
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc();
    _authenticationBloc.add(AppStartedEvent());
    super.initState();
  }

  @override
  void dispose() {
    _authenticationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authenticationBloc..add(AppStartedEvent()),
      child: MaterialApp(
        title: 'Pet Home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // colorScheme: const ColorScheme.dark(),
            // primarySwatch: Colors.blue,
            ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is UninitializedState) {
              return const CustomCircularProgressIndicator();
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
