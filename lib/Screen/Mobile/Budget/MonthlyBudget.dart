import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paykr/Screen/Mobile/Home.dart';

import '../../../Utilities/Color.dart';


class MonthlyBudget extends StatefulWidget {
  const MonthlyBudget({super.key});

  @override
  State<MonthlyBudget> createState() => _MonthlyBudgetState();
}

class _MonthlyBudgetState extends State<MonthlyBudget> {
  String name = 'John Deo';

  @override
  Widget build(BuildContext context) {
    final firstLetter = name.isNotEmpty ? name[0].toUpperCase() : '';
    return Scaffold(
      backgroundColor: PColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*.06,
                left: 20,
                right: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ///Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    /// Back Icon
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                          height: 35,
                          width: 35,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color(0xff3B23EB),
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: const Icon(HugeIcons.strokeRoundedArrowLeft01,
                              color: Color(0xffDACDFE),
                            ),
                          )
                      ),
                    ),

                    /// Title
                    Text('Budget',
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        color: const Color(0xffF6F7F8),
                        fontWeight: FontWeight.w600
                      ),
                    ),

                    ///More Icon
                    SizedBox(
                        height: 36,
                        width: 36,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: const Color(0xff3B23EB),
                              borderRadius: BorderRadius.circular(25),
                          ),
                          child: PopupMenuButton<String>(
                            icon: const Icon(
                              HugeIcons.strokeRoundedMoreHorizontalCircle01,
                              size: 21,
                            ),
                            iconColor: Colors.white,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'help',
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Home(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Get Help',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xff432DEC),
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'feedback',
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Home(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Send Feedback',
                                    style: GoogleFonts.inter(
                                        color: const Color(0xff432DEC),
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),


                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.065
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Monthly Budget',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffF6F7F8),
                          letterSpacing: -0.2
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Text('You’ve spent',
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                color: const Color(0xffF6F7F8),
                                letterSpacing: -0.12
                            ),
                          ),

                          const SizedBox(width: 5),

                          /// Show expenditure
                          SizedBox(
                            width: 45,
                            height: 20,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: Text('123',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 5),

                          Text('for the past 7 days',
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                color: const Color(0xffF6F7F8),
                                letterSpacing: -0.12
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                )

              ],
            ),
          ),
          
          /// White Box
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height/3.7 //for white box height
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Color(0xffF5F7FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*(375 / MediaQuery.of(context).size.width),
                      child: Row(
                        children: [
                          Text("What's left to spend",
                            style: GoogleFonts.inter(
                              color: const Color(0xff040C22),
                              fontSize: 15,
                              letterSpacing: -0.2,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          const Spacer(),
                          Text('N17,041',
                            style: GoogleFonts.inconsolata(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  ///Limit Card
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * (385 / MediaQuery.of(context).size.width),  // White card width
                        height: MediaQuery.of(context).size.height * (165 / MediaQuery.of(context).size.height),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                    Text('You’ve already spent',
                                      style: GoogleFonts.inter(
                                          color: const Color(0xff5C616F),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.12
                                      ),
                                    ),
                                    const Spacer(),
                                    Text('Spend Limit per Day',
                                      style: GoogleFonts.inter(
                                          color: const Color(0xff5C616F),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.12
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: Row(
                                  children: [

                                    const SizedBox(width: 10),

                                    ///Text
                                    Text('N1,200',
                                      style: GoogleFonts.inconsolata(
                                        fontSize: 24,
                                        color: const Color(0xff432DEC),
                                        fontWeight: FontWeight.w700
                                      ),
                                    ),

                                    const Spacer(),
                                    Text("400",
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
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
                                  color: const Color(0xff03E23B),
                                  value: .8,
                                  backgroundColor: const Color(0xff0D77CF).withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),

                              ///Message
                              Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: Row(
                                  children: [
                                    const Text('😘 '),
                                    Text("Cool! let's keep your expense below the budget",
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontSize: 12.5
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

                  Padding(
                    padding: const EdgeInsets.only(top:20, left: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*(375 / MediaQuery.of(context).size.width),
                      child: Text(
                        'Budget Transactions',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0E1B42)
                        ),
                      )
                    ),
                  ),

                  ///Transaction Card
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * (385 / MediaQuery.of(context).size.width),  // White card width
                        height: MediaQuery.of(context).size.height * (360 / MediaQuery.of(context).size.height),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                padding: const EdgeInsets.only(top: 18),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 24,
                                      child: Text(firstLetter,
                                        style: GoogleFonts.inter(
                                          fontSize: 22,
                                          color: const Color(0xff005CEE),
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(name,
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15
                                          ),
                                        ),

                                        Text('Date',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                            color: const Color(0xff131313).withOpacity(0.5)
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Text('+N20,983',
                                      style: GoogleFonts.inter(
                                          color: const Color(0xff1B7A00),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.12
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
