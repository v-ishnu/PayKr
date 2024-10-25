import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:paykr/Utilities/Color.dart';
import 'package:hugeicons/hugeicons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final user = FirebaseAuth.instance.currentUser?.uid;
  late String userEmail;
  bool _isBalanceVisible = false;
  final String _balance = "250";

  @override
  void initState(){
    super.initState();
    fetchUserData();
  }
  void fetchUserData(){
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      setState(() {
        userEmail = user.email ?? 'Email not available';
      });
    }
  }

  void toogleShowBalance(){
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
                    width: MediaQuery.of(context).size.width * (375 / MediaQuery.of(context).size.width),
                    height: MediaQuery.of(context).size.height * (375 / MediaQuery.of(context).size.height),
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
                          /// Right Icon
                          Padding(
                            padding: const EdgeInsets.only(top: 25, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ClipOval(
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff2310B2),
                                    ),
                                    child: const Icon(
                                      HugeIcons.strokeRoundedArrowRight01,
                                      color: Color(0xff978AF4),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Card Details
                          Column(
                            children: [
                              ///Avtar
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * (310 / MediaQuery.of(context).size.width),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: ClipOval(
                                            child: Container(
                                              width: 62,
                                              height: 62,
                                              decoration: const BoxDecoration(
                                                color: Color(0xffE9E9FF),
                                              ),
                                              child: Image.asset(
                                                'Assets/User/39057.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              ///Your available balance is
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text('Your available balance is',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xffFAFCFF),
                                    fontSize: 12,
                                  ),
                                ),
                              ),

                              ///Balance Check
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('₹',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xffFAFCFF),
                                      fontSize: 34,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    _isBalanceVisible ? _balance : '***',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xffFAFCFF),
                                      fontSize: 34,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      _isBalanceVisible ? HugeIcons.strokeRoundedViewOff : HugeIcons.strokeRoundedView,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isBalanceVisible = !_isBalanceVisible;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
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
                      width: MediaQuery.of(context).size.width * (375 / MediaQuery.of(context).size.width),
                      height: MediaQuery.of(context).size.height * (100 / MediaQuery.of(context).size.height),
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
                                    child: const Icon(HugeIcons.strokeRoundedDiscount,
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
                                      child: const Text('!',
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
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sort your transactions',
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),

                                  Text('Get points for sorting your transactions',
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12
                                    ),
                                    softWrap: true,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff2310B2),
                                ),
                                child: const Icon(HugeIcons.strokeRoundedArrowRight01,
                                color: Color(0xff978AF4),
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
                child: Text('My Budget',
                  style: GoogleFonts.inter(
                    color: const Color(0xffC1B9F9),
                    fontSize: 15,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * (375 / MediaQuery.of(context).size.width),
                  height: MediaQuery.of(context).size.height * (200 / MediaQuery.of(context).size.height),
                  decoration: BoxDecoration(
                    color: const Color(0xff432DEC),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Text('You have',
                              style: GoogleFonts.inter(
                                color: Colors.white.withOpacity(0.85),
                                fontSize: 16,
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
                        Text('₹ $_balance',
                          style:GoogleFonts.inter(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          )
                        ),
                        Text('Left out of N80,888 budgeted',
                            style:GoogleFonts.inter(
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),
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
                child: Text('Transaction',
                  style: GoogleFonts.inter(
                    color: const Color(0xffC1B9F9),
                    fontSize: 15,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * (375 / MediaQuery.of(context).size.width),
                  height: MediaQuery.of(context).size.height * (200 / MediaQuery.of(context).size.height),
                  decoration: BoxDecoration(
                      color: const Color(0xff432DEC),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Text('You have',
                                style: GoogleFonts.inter(
                                  color: Colors.white.withOpacity(0.85),
                                  fontSize: 16,
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
                        Text(_balance,
                            style:GoogleFonts.inter(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            )
                        )
                      ],
                    ),
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
