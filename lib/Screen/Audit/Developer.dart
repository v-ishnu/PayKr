import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utilities/Color.dart';

class Developer extends StatefulWidget {
  const Developer({super.key});

  @override
  State<Developer> createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: PColor,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Developer',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            //Linkedin
            InkWell(
              onTap: () {
                String url = 'https://www.linkedin.com/in/vishnuinfo/';
                launch(url);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    SizedBox(
                      width: 52,
                      height: 52,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Container(
                          color: const Color(0xffE9E9FF),
                          child: Image.asset(
                            'Assets/Developer/Vishnu.jpg',
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vishnu Prakash',
                            style: GoogleFonts.inter(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Connect me on LinkedIn',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //App Version
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.1,
              ),
              child: Transform.rotate(
                angle: -1.5708,
                child: SizedBox(
                  width: MediaQuery.of(context).size.height, //after rotating width becomes height
                  height: MediaQuery.of(context).size.width, // and height becomes width
                  child: Padding(
                    padding:  EdgeInsets.only(
                      top:MediaQuery.of(context).size.width/1.48, // top means width
                    ),
                    child: Text("v1.0.1",
                          style: GoogleFonts.museoModerno(
                            color: Colors.white.withOpacity(0.15),
                            fontWeight: FontWeight.w900,
                            fontSize: 145
                          )
                        ),
                  ),
                ),
              ),
            ),

            //Developer Company
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height/1.28
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 50,
                      height: 40,
                      child: Lottie.asset('Assets/stack.json')),
                  const Text('NexGen Lab',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
