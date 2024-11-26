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
                                              color: Color(0x907BFFB2),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Row(
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
              InkWell(
                onTap: () => {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff2816A7),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff5844EE),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(
                                      HugeIcons.strokeRoundedDiscount,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: -7,
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Text(
                                        '!',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sort your transactions',
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Get points for sorting your transactions',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12),
                                    softWrap: true,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22),
                              child: SizedBox(
                                width: 35,
                                height: 35,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color(0xff2310B2),
                                  ),
                                  child: const Icon(
                                    HugeIcons.strokeRoundedArrowRight01,
                                    color: Color(0xff978AF4),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
