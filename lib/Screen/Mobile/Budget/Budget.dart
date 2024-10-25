import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paykr/Screen/Mobile/Budget/MonthlyBudget.dart';
import 'package:paykr/Screen/Mobile/Budget/WeeklyBudget.dart';

import '../../../Utilities/Color.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  final String _balance = "250";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColor,
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [

            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.05
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Budget',
                      style: GoogleFonts.inter(
                        color: FontColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('₹$_balance',
                        style: GoogleFonts.inter(
                          color: FontColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          height: .25
                        ),
                      ),
                      const SizedBox(width: 7),
                      Text('left',
                        style: GoogleFonts.inter(
                          color: FontColor,
                          fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('Out of N80,888 budgeted',
                    style: GoogleFonts.inter(
                      color: FontColor,
                      fontSize: 15
                    ),
                  ),
                ),

                /// Create Budget Button
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        width: 142,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xffE9E9FF),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 15,
                              ),
                              Text(
                                'Create new budget',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ///Image
            const Padding(
              padding: EdgeInsets.only(
                  top: 60,
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    child: Opacity(
                      opacity: 0.35,
                      child: Image(
                        image: AssetImage('Assets/Budget/Coin.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Transform.rotate(
                    angle: -0.01,
                    child: const Opacity(
                      opacity: 0.5,
                      child: Image(
                          image: AssetImage('Assets/Budget/img.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),


            ///Weekly & Monthly Budget Report
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height/3.5
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  children: [
                    /// Monthly Report
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MonthlyBudget()
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * (375 / MediaQuery.of(context).size.width),
                            height: MediaQuery.of(context).size.height * (195 / MediaQuery.of(context).size.height),
                            decoration: BoxDecoration(
                                color: const Color(0xff432DEC),
                                borderRadius: BorderRadius.circular(22)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Monthly Text
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Row(
                                      children: [
                                        Text('Monthly Budget',
                                          style: GoogleFonts.inter(
                                              color: Colors.white.withOpacity(0.85),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color: const Color(0xff2D14E0,)
                                            ),
                                            child: const Icon(
                                              HugeIcons.strokeRoundedArrowRight01,
                                              color: Color(0xff978AF4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                            radius: 25,
                                            child: Text('🎉',
                                              style: TextStyle(
                                                fontSize: 30,
                                              ),
                                            )
                                        ),
                                        const SizedBox(width: 10),

                                        ///Text
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Flexing Budget',
                                              style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text('N140 daily',
                                              style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            )
                                          ],
                                        ),

                                        const Spacer(),
                                        Text('53747',
                                          style: GoogleFonts.inter(
                                              color: const Color(0xff21F46A),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///Progress Bar
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: LinearProgressIndicator(
                                      color: const Color(0xff32FC65),
                                      value: .8,
                                      backgroundColor: const Color(0xff32FC65).withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),

                                  ///Message
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Row(
                                      children: [
                                        const Text('😘'),
                                        Text('You are doing really great! ',
                                          style: GoogleFonts.inter(
                                              color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),


                    /// Weekly Report
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=> const WeeklyBudget()
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * (375 / MediaQuery.of(context).size.width),
                            height: MediaQuery.of(context).size.height * (195 / MediaQuery.of(context).size.height),
                            decoration: BoxDecoration(
                                color: const Color(0xff432DEC),
                                borderRadius: BorderRadius.circular(22)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Monthly Text
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Row(
                                      children: [
                                        Text('Weekly Budget',
                                          style: GoogleFonts.inter(
                                              color: Colors.white.withOpacity(0.85),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color: const Color(0xff2D14E0,)
                                            ),
                                            child: const Icon(
                                              HugeIcons.strokeRoundedArrowRight01,
                                              color: Color(0xff978AF4),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                            radius: 25,
                                            child: Text('🎉',
                                              style: TextStyle(
                                                fontSize: 30,
                                              ),
                                            )
                                        ),
                                        const SizedBox(width: 10),

                                        ///Text
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Flexing Budget',
                                              style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text('N140 daily',
                                              style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            )
                                          ],
                                        ),

                                        const Spacer(),
                                        Text('53747',
                                          style: GoogleFonts.inter(
                                              color: const Color(0xff21F46A),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///Progress Bar
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: LinearProgressIndicator(
                                      color: const Color(0xff32FC65),
                                      value: .8,
                                      backgroundColor: const Color(0xff32FC65).withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),

                                  ///Message
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Row(
                                      children: [
                                        const Text('😘'),
                                        Text('You are doing really great! ',
                                          style: GoogleFonts.inter(
                                              color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
