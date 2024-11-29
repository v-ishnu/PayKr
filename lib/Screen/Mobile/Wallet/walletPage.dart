import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconly/iconly.dart';

import '../../../Utilities/Color.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final user = FirebaseAuth.instance.currentUser?.uid;
  late String userEmail;
  bool _isBalanceVisible = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email ?? 'Email not available';
      });
    }
  }

  void toogleShowBalance() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello $userEmail',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: FontColor,
                    ),
                  ),
                  Text(
                    'Your finances are looking good',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: FontColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xff2812C9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  IconlyLight.notification,
                  color: FontColor,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 40,
              height: 40,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xff2812C9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  IconlyLight.search,
                  color: FontColor,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: PColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Card
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.93,
                    height: MediaQuery.of(context).size.height * 0.21,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff2816A7),
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('Assets/3d-Illustrator/Vector.png'),
                          fit: BoxFit.contain,
                          repeat: ImageRepeat.repeat,
                        ),
                      ),
                      child: Stack(
                        children: [
                          /// Card Details
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ///Your available balance is
                                Text(
                                  'Wallet',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xffFAFCFF),
                                    fontSize: 18,
                                  ),
                                ),

                                Text(
                                  '\$ 274,192.5',
                                  style: GoogleFonts.inter(
                                      fontSize: 35,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),

                                // Monthly Expenditure
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Monthly Expenditure",
                                          style: GoogleFonts.inter(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "+ \$3,212.5",
                                          style: GoogleFonts.inter(
                                              color: Colors.green),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: SizedBox(
                                        width: 65,
                                        height: 30,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: const Color(0x907BFFB2),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: const Row(
                                            children: [
                                              Icon(IconlyLight.arrow_up_circle),
                                              Text("8%")
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                        // child:
                      ),
                    ),
                  ),
                ),
              ),

              ///Transaction
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.93,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // Distribute evenly
                      children: [
                        // First Container
                        Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width *
                                    0.22, // Set width
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                  color: const Color(0xff2816A7),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const HugeIcon(
                                  icon: HugeIcons.strokeRoundedUpload03,
                                  color: Colors.white,
                                  size: 37,
                                )),
                            const SizedBox(
                                height: 8), // Space between container and text
                            const Text(
                              'Send',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        // Second Container
                        Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width *
                                    0.22, // Set width
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xff2816A7), // Example color
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const HugeIcon(
                                  icon: HugeIcons.strokeRoundedDownload03,
                                  color: Colors.white,
                                  size: 37,
                                )),
                            const SizedBox(height: 8),
                            const Text(
                              'Receive',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        // Third Container
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  0.22, // Set width
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: const Color(0xff2816A7), // Example color
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const HugeIcon(
                                icon: HugeIcons.strokeRoundedCreditCard,
                                color: Colors.white,
                                size: 37,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'History',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        // Fourth Container
                        Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width *
                                    0.22, // Set width
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xff2816A7), // Example color
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const HugeIcon(
                                  icon: HugeIcons.strokeRoundedExchange03,
                                  color: Colors.white,
                                  size: 37,
                                )),
                            const SizedBox(height: 8),
                            const Text(
                              'Settings',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ///My Budget
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 30, bottom: 15),
                child: Text(
                  'My Budget',
                  style: GoogleFonts.inter(
                    color: const Color(0xffC1B9F9),
                    fontSize: 15,
                  ),
                ),
              ),

              /// Transaction
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  top: 20,
                  bottom: 15,
                ),
                child: Text(
                  'Transaction',
                  style: GoogleFonts.inter(
                    color: const Color(0xffC1B9F9),
                    fontSize: 15,
                  ),
                ),
              ),

              /// Space
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
