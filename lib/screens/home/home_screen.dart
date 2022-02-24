import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_bloc.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_event.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_state.dart';
import 'package:my_little_sea_house/screens/login/login_screen,.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("My Auth Example"),
            actions: [
              (state is AuthAuthenticatedState)
                  ? IconButton(
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(AuthLogoutEvent());
                      },
                      splashRadius: 23,
                      icon: const Icon(
                        Icons.logout,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      splashRadius: 23,
                      icon: const Icon(
                        Icons.login,
                      ),
                    ),
            ],
          ),
          body: Center(
            child: Text(
              (state is AuthAuthenticatedState)
                  ? state.user.displayName
                  : 'Not Authenticated',
            ),
          ),
        );
      },
    );
  }
}
