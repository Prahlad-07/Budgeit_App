import 'package:budgeit/constants/app_themes.dart';
import 'package:budgeit/constants/colors.dart';
import 'package:budgeit/ui/screens/auth/login_screen.dart';
import 'package:budgeit/ui/screens/home/home_screen.dart';
import 'package:budgeit/ui/screens/my_wallet/wallet_screen.dart';
import 'package:budgeit/ui/screens/plan/planning_screen.dart';
import 'package:budgeit/ui/screens/user_profile/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final controller = PersistentTabController(initialIndex: 0);
  int currentIndex = 0;

  List<Widget> _buildScreen() {
    return const [
      HomeScreen(),
      WalletScreen(),
      PlanningScreeen(),
      UserProfileScreeen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarItem() {
    dynamic navBarColor = BudgeitThemes.isDarkMode(context) == true
        ? kDarkPurpleNavIconC
        : kPurpleNavC;
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: navBarColor,
        activeColorPrimary: currentIndex == 0 ? Colors.white : navBarColor,
        icon: const Icon(Icons.home),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: navBarColor,
        activeColorPrimary: currentIndex == 1 ? Colors.white : navBarColor,
        icon: const Icon(Icons.account_balance_wallet),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: navBarColor,
        activeColorPrimary: currentIndex == 2 ? Colors.white : navBarColor,
        icon: const Icon(Icons.article),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: navBarColor,
        activeColorPrimary: currentIndex == 3 ? Colors.white : navBarColor,
        icon: const Icon(Icons.person),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PersistentTabView(
            context,
            screens: _buildScreen(),
            items: navBarItem(),
            controller: controller,
            onItemSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            navBarHeight: 60,
            decoration: NavBarDecoration(
              colorBehindNavBar: BudgeitThemes.isDarkMode(context) == true
                  ? kDarkPurpleBackC
                  : kPurpleDarkC,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.all(0),
            backgroundColor: Theme.of(context).primaryColor,
            navBarStyle: NavBarStyle.style3,
            animationSettings: const NavBarAnimationSettings(
              navBarItemAnimation: ItemAnimationSettings(
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimationSettings(
                curve: Curves.ease,
              ),
            ),
          );
        }

        return const LoginScreen();
      },
    );
  }
}
