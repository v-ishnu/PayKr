import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../Utilities/Component/Search.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final List<Map<String, String>> items = [
    {
      "title": "How to sort transactions on Brees?",
      "subtitle": "You can add your multiple bank accounts including, Piggyvest savings, Crypto wallets, ...",
      "image": "assets/bank.png"
    },
    {
      "title": "Manage your finances",
      "subtitle": "Keep track of your spending and saving with our financial tools.",
      "image": "assets/finance.png"
    },
    {
      "title": "Investment Tips",
      "subtitle": "Learn how to make smart investments and grow your wealth.",
      "image": "assets/investment.png"
    },
    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff210EA4),
      body: Stack(
        children: [
          /// Back , SearchBar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .06,
                    left: 20,
                    right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Icon
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                          height: 35,
                          width: 35,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              // color: const Color(0xff3B23EB),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: const Color(0xffC4C4C4)
                                        .withOpacity(0.4))),
                            child: const Icon(
                              HugeIcons.strokeRoundedArrowLeft01,
                              color: Color(0xffDACDFE),
                            ),
                          )),
                    ),

                    //Dice
                    const SizedBox(
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Opacity(
                          opacity: 0.7,
                          child: Image(
                            image: AssetImage('Assets/3d-Illustrator/dice.png'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 25,
                ),
                child: Text(
                  'Have a burning Question?',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width *
                        (363 / MediaQuery.of(context).size.width),
                    child: const Search(),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3 //for white box height
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Color(0xffF5F7FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width *
                          (375 / MediaQuery.of(context).size.width),
                      child: Row(
                        children: [
                          Text(
                            "Topics",
                            style: GoogleFonts.inter(
                                color: const Color(0xff210EA4),
                                fontSize: 15,
                                letterSpacing: -0.2,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            'View All',
                            style: GoogleFonts.inter(
                                color: const Color(0xff210EA4),
                                fontSize: 15,
                                letterSpacing: -0.2,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            (385 / MediaQuery.of(context).size.width),
                        decoration: const BoxDecoration(
                          color: Color(0xffF5F7FF),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return CustomCard(
                              title: items[index]['title']!,
                              subtitle: items[index]['subtitle']!,
                              imagePath: items[index]['image']!,
                            );
                          },
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

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const CustomCard({super.key, 
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // elevation: 5,
      // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: SizedBox(
        height: 186,
        child: Stack(
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
