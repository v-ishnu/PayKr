import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:paykr/Screen/Mobile/Home.dart';
import '../Screen/Mobile/Transactions.dart';
import '../Screen/Mobile/Budget/Budget.dart';
import '../Screen/Mobile/Profile/Profile.dart';



class NavigationMenuBar extends StatefulWidget {
  int myIndex = 0;

  final List<Widget> widgetList = [
    const Home(),
    const Budget(),
    const Transactions(),
    const Profile()
  ];

  NavigationMenuBar({super.key});

  @override
  State<NavigationMenuBar> createState() => _NavigationMenuBarState();
}

class _NavigationMenuBarState extends State<NavigationMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: widget.myIndex,
        children: widget.widgetList,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: GNav(
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: const Color(0xff2475ee),
                padding: const EdgeInsets.all(16),
                gap: 8,
                tabs: const [
                  GButton(
                      icon: Icons.home_filled,
                      text: 'Home'
                  ),
                  GButton(
                      icon: Icons.directions_train_rounded,
                      text: 'Discover'
                  ),
                  GButton(
                      icon: Icons.history_outlined,
                      text: 'B-History'
                  ),
                  GButton(
                    icon: Icons.history_outlined,
                    text: 'Profile'
                  ),
                ],
                selectedIndex: widget.myIndex,
                onTabChange: (index) {
                  setState(() {
                    widget.myIndex = index;
                  });
                }
            ),
          ),
        ),
      ),
    );
  }
}

