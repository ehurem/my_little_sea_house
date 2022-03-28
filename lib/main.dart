import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_event.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_state.dart';
import 'package:my_little_sea_house/bloc/navigation/navigation_cubit.dart';
import 'package:my_little_sea_house/bloc/register/register_bloc.dart';
import 'package:my_little_sea_house/screens/bottom_app_bar/root_screen.dart';
import 'package:my_little_sea_house/screens/register/register_screen.dart';
import 'package:my_little_sea_house/screens/welcome/welcome_screen.dart';
import 'package:my_little_sea_house/widgets/custom_loading_bar_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthenticationBloc _authenticationBloc;
  final _navigationCubit = NavigationCubit();
  final _registerBloc = RegisterBloc();

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc();
    _authenticationBloc.add(AppStartedEvent());
    super.initState();
  }

  @override
  void dispose() {
    _authenticationBloc.add(AuthLogoutEvent());
    _authenticationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) =>
              _authenticationBloc..add(AppStartedEvent()),
        ),
        BlocProvider<NavigationCubit>(
          create: (BuildContext context) => NavigationCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Pet Home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // colorScheme: const ColorScheme.dark(),
            // primarySwatch: Colors.blue,
            ),
        routes: {
          '/register': (context) => BlocProvider.value(
                value: _registerBloc,
                child: const RegisterScreen(),
              ),
          '/root': (context) => BlocProvider.value(
                value: _navigationCubit,
                child: const RootScreen(),
              ),
        },
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is UninitializedState) {
              return const CustomLoadingBar();
            }
            // else if (state is AuthAuthenticatedState) {
            //   return const RootScreen();
            // }
            else {
              return const WelcomeScreen();
            }
          },
        ),
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('pt', ''),
          Locale('es', ''),
          Locale('fa', ''),
          Locale('fr', ''),
          Locale('ja', ''),
          Locale('sk', ''),
          Locale('pl', ''),
        ],
      ),
    );
  }
}
