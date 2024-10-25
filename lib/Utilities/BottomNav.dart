import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:paykr/Screen/Mobile/Budget/Budget.dart';
import 'package:paykr/Screen/Mobile/Profile/Profile.dart';
import 'package:paykr/Screen/Mobile/Transactions.dart';
import 'package:paykr/Utilities/Color.dart';
import 'dart:ui';

import '../Screen/Mobile/Home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int myCurrentIndex = 0;

  final List<Widget> widgetList = [
    const Home(),
    const Budget(),
    const Transactions(),
    const Profile(),

    // Add other screens here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: myCurrentIndex,
        children: widgetList,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
          height: 56,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 20),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildNavItem(IconlyBold.home, IconlyBroken.home, 0),
                    buildNavItem(IconlyBold.category, IconlyBroken.category, 1),
                    buildNavItem(IconlyBold.chart, IconlyBroken.chart, 2),
                    buildNavItem(IconlyBold.profile, IconlyBroken.profile, 3),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(IconData selectedIcon, IconData unselectedIcon, int index) {
    bool isSelected = myCurrentIndex == index;
    bool isProfileSelected = myCurrentIndex == 3;
    bool isBudgetSelected = myCurrentIndex == 1;


    Color iconColor = isProfileSelected || isBudgetSelected
        ? PColor
        : (isSelected ? Colors.white : Colors.white.withOpacity(0.7));


    IconData icon = isProfileSelected && index == 3 || isBudgetSelected && index == 1
        ? selectedIcon
        : (isSelected ? selectedIcon : unselectedIcon);

    return GestureDetector(
      onTap: () {
        setState(() {
          myCurrentIndex = index;
        });
      },
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
