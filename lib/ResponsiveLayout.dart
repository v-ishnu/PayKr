import 'package:flutter/material.dart';
import 'package:paykr/Screen/Mobile/Splash Screen.dart';


class ResponsiveLayout extends StatefulWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveLayout({super.key, required this.mobile, required this.desktop});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const SplashScreen();
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
