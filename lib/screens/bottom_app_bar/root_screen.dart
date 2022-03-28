import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_little_sea_house/bloc/navigation/nav_bar_items.dart';
import 'package:my_little_sea_house/bloc/navigation/navigation_cubit.dart';
import 'package:my_little_sea_house/screens/bills/bills_screen.dart';
import 'package:my_little_sea_house/screens/home/home_screen.dart';
import 'package:my_little_sea_house/screens/profile/profile_screen.dart';
import 'package:my_little_sea_house/screens/settings/schedule_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: const Color.fromARGB(255, 95, 180, 182),
                unselectedItemColor: Colors.grey.shade400,
                currentIndex: state.index,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.home,
                      size: size.width * 0.07,
                    ),
                    icon: Icon(
                      Icons.home_outlined,
                      size: size.width * 0.07,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.calendar_month,
                      size: size.width * 0.06,
                    ),
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      size: size.width * 0.06,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      FontAwesomeIcons.bolt,
                      size: size.width * 0.06,
                    ),
                    icon: Icon(
                      FontAwesomeIcons.boltLightning,
                      size: size.width * 0.06,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      FontAwesomeIcons.solidCircleUser,
                      size: size.width * 0.06,
                    ),
                    icon: Icon(
                      FontAwesomeIcons.circleUser,
                      size: size.width * 0.06,
                    ),
                    label: '',
                  ),
                ],
                onTap: (index) {
                  if (index == 0) {
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavbarItem.home);
                  } else if (index == 1) {
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavbarItem.schedule);
                  } else if (index == 2) {
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavbarItem.bills);
                  } else if (index == 3) {
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavbarItem.profile);
                  }
                },
              );
            },
          ),
          body: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
            if (state.navbarItem == NavbarItem.home) {
              return HomeScreen();
            } else if (state.navbarItem == NavbarItem.schedule) {
              return ScheduleScreen();
            } else if (state.navbarItem == NavbarItem.bills) {
              return BillsScreen();
            } else if (state.navbarItem == NavbarItem.profile) {
              return ProfileScreen();
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
