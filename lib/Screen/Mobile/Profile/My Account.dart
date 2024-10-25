import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../Utilities/Color.dart';


class myAccount extends StatefulWidget {
  const myAccount({super.key});

  @override
  State<myAccount> createState() => _myAccountState();
}

class _myAccountState extends State<myAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: P_bgColor,
      appBar: AppBar(
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
        title: Text('My Account',
          style:GoogleFonts.inter(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          //Profile Picture
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('Assets/Developer/Vishnu.jpg'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: SizedBox(
                            width: 46,
                            height: 46,
                            child: TextButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                backgroundColor:WidgetStateProperty.all(
                                    const Color(0xffF5F6F9)
                                ),
                                side: WidgetStateProperty.all(
                                    const BorderSide(
                                      color: Colors.white,
                                      width: 2
                                    )
                                )
                              ),
                              child: const Icon(
                                  HugeIcons.strokeRoundedCamera01
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),

          //Name
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: const TextStyle(
                          color: Color(0xff8F8F8F)
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.transparent), // Change border color here
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.transparent), // Change border color here
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ), //ENTER PASSWORD

          //Email
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.34),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          color: Color(0xff8F8F8F)
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.transparent), // Change border color here
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.transparent), // Change border color here
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Mobile
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.43),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mobile NO.',
                      hintStyle: const TextStyle(
                          color: Color(0xff8F8F8F)
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.transparent), // Change border color here
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.transparent), // Change border color here
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Button
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.30),
            child: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.82,
                        decoration: BoxDecoration(
                          color: const Color(0xffE9E9FF),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff4A44C6),
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
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
}
