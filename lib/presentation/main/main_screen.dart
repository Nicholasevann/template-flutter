import 'package:auto_route/auto_route.dart';
import 'package:example/presentation/main/account/account_screen.dart';
import 'package:example/presentation/main/category/category_screen.dart';
import 'package:example/presentation/main/home/home_screen.dart';
import 'package:flutter/material.dart';

const List<Widget> screens = <Widget>[
  HomeScreen(),
  CategoryScreen(),
  AccountScreen(),
  AccountScreen(),
  AccountScreen(),
];

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeMenu = 0;

  @override
  Widget build(BuildContext context) {
    // final t = Translations.of(context);
    return Scaffold(
      body: screens[activeMenu],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeMenu,
        onTap: (index) => setState(() => activeMenu = index),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: [
          bottomNavBarItem(icon: 'home', label: 'Home'),
          bottomNavBarItem(icon: 'search', label: 'Categories'),
          bottomNavBarItem(icon: 'camera', label: 'Notifications'),
          bottomNavBarItem(icon: 'star', label: 'Saved'),
          bottomNavBarItem(icon: 'more-horizontal', label: 'Account'),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      activeIcon: const Padding(
        padding: EdgeInsets.only(bottom: 4.0),
        child: Icon(Icons.person),
      ),
      icon: const Padding(
        padding: EdgeInsets.only(bottom: 4.0),
        child: Icon(Icons.person),
      ),
      label: label,
    );
  }
}
