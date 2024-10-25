import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:paykr/Utilities/Color.dart';
import 'package:paykr/Screen/Mobile/Login.dart';

import '../../Auth/Wrapper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OColor,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
                onLastPage = (index == 2);
              });
            },
            children: [
              // Page 1
              buildPage(
                'Assets/3d-Illustrator/Screens=Illustration 1.png',
                'You ought to know where your money goes',
                'Get an overview of how you are performing and motivate yourself to achieve even more.',
                CardColor,
              ),

              // Page 2
              buildPage(
                'Assets/3d-Illustrator/Screens=Illustration 2.png',
                'Gain total control of your money',
                'Track your transaction easily, with categories and financial report',
                CardColor,
              ),

              // Page 3
              buildPage(
                'Assets/3d-Illustrator/Screens=Illustration 3.png',
                'Plan ahead and manage your money better',
                'Setup your budget for each category so you in control. Track categories you spend the most money on',
                CardColor,
              ),
            ],
          ),

          // Skip Button
          Positioned(
            top: 45,
            right: 20,
            child: GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isFirstTime', false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => /*const  NavBar()  LoginPage() */const Wrapper()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: SkipColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: FontSize,
                      color: FontColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(String imagePath, String title, String description, Color cardColor) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Container(
      color: OColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 90.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: widthScreen * 0.7,
              height: heightScreen * 0.4,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: widthScreen * 0.88,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                color: cardColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 40),

                    //Card Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: C_header_Text,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 15),

                    //Card Subtitle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: 14,
                            color: C_sub_Text
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Smooth Page Indicator and Next Button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // Smooth Page Indicator
                          SmoothPageIndicator(
                            controller: _controller,
                            count: 3,
                            onDotClicked: (index)=> _controller.animateToPage(
                                index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
                            effect: CustomizableEffect(
                                activeDotDecoration: DotDecoration(
                                  width: 8,
                                  height: 20,
                                  borderRadius: BorderRadius.circular(24),
                                  color: ActiveDotColor,
                                ),
                                dotDecoration: DotDecoration(
                                    height: 8,
                                    width: 8,
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(24)
                                ),
                                spacing: 8
                            ),
                          ),

                          const SizedBox(height: 25),

                          // Next Button
                          GestureDetector(
                            onTap: (){
                              if (onLastPage) {
                                // Navigate to other screen when Next is pressed on the last page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                                );
                              } else {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(

                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.6,
                                decoration: BoxDecoration(
                                  color: BtnColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 18),
                                  child: Text(
                                    currentPageIndex == 2 ? 'Get Started' : 'Next',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
