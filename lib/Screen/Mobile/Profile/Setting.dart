import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paykr/Screen/Mobile/Login.dart';
import '../../../Utilities/Color.dart';
import '../../../Auth/auth_service.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _auth = AuthService();

  // Sign out user
  // Future<void> signout() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     // Navigate to login or home screen after signing out
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //         builder: (context) => LoginPage()
  //         )
  //     );
  //   } catch (e) {
  //     print("Error signing out: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: P_bgColor,
      appBar:AppBar(
        backgroundColor: P_bgColor,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
                HugeIcons.strokeRoundedArrowLeft01
            )
        ),
        toolbarHeight: 60,
        title: Text('Setting',
          style:GoogleFonts.inter(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //General
              Text('General',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xff6C727F),
                  fontWeight: FontWeight.w600
                ),
              ),

              //Reset Password
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.03
                ),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*1,
                  child: InkWell(
                    onTap: (){},
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        Text('Reset Pasword',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const Spacer(),
                        const Icon(HugeIcons.strokeRoundedArrowRight01,
                          size: 24,
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10,),

              //Notification
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width*1,
                child: InkWell(
                  onTap: (){},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Row(
                    children: [
                      Text('Notification',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const Spacer(),
                      const Icon(HugeIcons.strokeRoundedArrowRight01,
                        size: 24,
                      )
                    ],
                  ),
                ),
              ),


              //Security
              Padding(
                padding:  EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.03,
                ),
                child: Text('Security',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xff6C727F),
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),

              //Privacy Policy
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.03,
                ),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*1,
                  child: InkWell(
                    onTap: (){},
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Privacy
                        Row(
                          children: [
                            Text('Privacy Policy',
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const Spacer(),
                            const Icon(HugeIcons.strokeRoundedArrowRight01,
                              size: 24,
                            )
                          ],
                        ),
                        const Text('Choose what data you share with us')
                      ],
                    ),
                  ),
                ),
              ),


              //Button
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height/2.25,
                    bottom: 10,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      await _auth.signout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.82,
                      decoration: BoxDecoration(
                        color: const Color(0xffE9E9FF),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff4A44C6),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Version
              Center(
                child: Text('PayKr © 2024 v1.0',
                  style: GoogleFonts.inter(
                    fontSize: 12
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
