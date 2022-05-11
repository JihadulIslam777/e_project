import 'package:e_project/home_page.dart';
import 'package:e_project/log_in.dart';
import 'package:e_project/profile_page.dart';
import 'package:e_project/settings.dart';
import 'package:e_project/sign_up.dart';
import 'package:flutter/material.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  static const TextStyle _textStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    fontStyle: FontStyle.italic,
  );

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const SignUp(),
    const LogIn(),
    const HomePage(),
    const MyProfile(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          _currentIndex = newIndex;
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.login_outlined),
            label: 'home',
            selectedIcon: Icon(Icons.login),
          ),
          NavigationDestination(
            icon: Icon(Icons.signpost_outlined),
            label: 'home',
            selectedIcon: Icon(Icons.signpost),
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'home',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            label: 'profile',
            selectedIcon: Icon(Icons.person),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'settings',
            selectedIcon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
