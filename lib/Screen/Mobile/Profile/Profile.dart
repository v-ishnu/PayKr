import 'package:flutter/material.dart';
import 'package:paykr/Screen/Audit/Developer.dart';
import 'package:intl/intl.dart'; // Import this for date formatting
import 'package:paykr/Screen/Mobile/HelpCenter.dart';
import 'package:paykr/Screen/Mobile/Profile/My%20Account.dart';
import 'package:paykr/Screen/Mobile/Profile/Setting.dart';
import 'package:paykr/Utilities/Color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconly/iconly.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paykr/Utilities/BottomNav.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String userEmail;
  late DateTime? registrationDate;
  late String monthsSinceRegistration = '' ;
  final user = FirebaseAuth.instance.currentUser?.uid;

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
        registrationDate = user.metadata.creationTime;
        if (registrationDate != null) {
          monthsSinceRegistration = _calculateRegistrationDuration(registrationDate!, DateTime.now());
        }
      });
    }
  }

  String _calculateRegistrationDuration(DateTime startDate, DateTime endDate){
    Duration difference = endDate.difference(startDate);

    if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} hours';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days';
    } else {
      int yearsDifference = endDate.year - startDate.year;
      int monthsDifference = endDate.month - startDate.month;
      int totalMonths = yearsDifference * 12 + monthsDifference;

      if (yearsDifference == 0) {
        return '$totalMonths months';
      } else if (yearsDifference == 1 && monthsDifference == 0) {
        return '1 year';
      } else if (yearsDifference > 1 && monthsDifference == 0) {
        return '$yearsDifference years';
      } else if (yearsDifference == 1 && monthsDifference > 0) {
        return '1 year $monthsDifference months';
      } else if (yearsDifference > 1 && monthsDifference > 0) {
        return '$yearsDifference years $monthsDifference months';
      } else {
        return 'Unknown duration';
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
            children: [

              //Profile and Edit Profile
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 55),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Profile',
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: FontColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const myAccount())),
                      child: Text(
                        'Edit Profile',
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: FontColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //User Avtar amd Username
              Positioned(
                top: 120, // Adjust this value to set the desired position
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipOval(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffE9E9FF),
                            ),
                            child: Image.asset(
                              'Assets/User/Boy.jpg',
                              fit: BoxFit.contain
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userEmail.toUpperCase(),
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(userEmail,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Setting List
              Padding(
                padding: EdgeInsets.only(
                    top:MediaQuery.of(context).size.height/3.4
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: P_bgColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)
                    )
                  ),
                  child: Stack(
                    children: [
                      //My Account
                      Positioned(
                        top: 10, // Adjust this value to set the desired position
                        left: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const myAccount()
                              )
                          ),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffE9E9FF),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(HugeIcons.strokeRoundedUser),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Text(
                                    'My Account',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  IconlyLight.arrow_right_2,
                                  size: 22,
                                  color: Color(0xffD3D5DA),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //Setting
                      Positioned(
                        top: 80, // Adjust this value to set the desired position with space
                        left: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Setting())),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffE9E9FF),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(IconlyLight.setting),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Text(
                                    'Setting',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  IconlyLight.arrow_right_2,
                                  size: 22,
                                  color: Color(0xffD3D5DA),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //Help Center
                      Positioned(
                        top: 150, // Adjust this value to set the desired position with space
                        left: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpCenter())),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffE9E9FF),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(HugeIcons.strokeRoundedQuestion),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Text(
                                    'Help Center',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  IconlyLight.arrow_right_2,
                                  size: 22,
                                  color: Color(0xffD3D5DA),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //Contact
                      Positioned(
                        top: 220, // Adjust this value to set the desired position with space
                        left: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NavBar())),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffE9E9FF),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(HugeIcons.strokeRoundedCustomerService),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Text(
                                    'Contact',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  IconlyLight.arrow_right_2,
                                  size: 22,
                                  color: Color(0xffD3D5DA),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //Developer Details
                      Positioned(
                        top: 290, // Adjust this value to set the desired position with space
                        left: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Developer())),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffE9E9FF),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(HugeIcons.strokeRoundedDeveloper),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Text(
                                    'Developer',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  IconlyLight.arrow_right_2,
                                  size: 22,
                                  color: Color(0xffD3D5DA),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Text WHen you joined.
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height/1.27,
                  left: 25,
                  right: 25,
                ),
                child: Text('You joined PayKr on ${
                    registrationDate != null ? DateFormat('dd MMMM yyyy').format(registrationDate!) : 'Unknown date'
                }. It’s been $monthsSinceRegistration since then and our mission is still the same help you better manage your finance like a PayKr.',
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
      ),
    );
  }
}
