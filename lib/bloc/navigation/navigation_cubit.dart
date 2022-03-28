import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.schedule:
        emit(NavigationState(NavbarItem.schedule, 1));
        break;
      case NavbarItem.bills:
        emit(NavigationState(NavbarItem.bills, 2));
        break;
      case NavbarItem.profile:
        emit(NavigationState(NavbarItem.profile, 3));
        break;
    }
  }
}
