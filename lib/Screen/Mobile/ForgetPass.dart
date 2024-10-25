import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paykr/Utilities/Color.dart';
import 'package:flutter/services.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _verificationCodeController = TextEditingController();

  bool _isButtonClicked = false;
  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    emailAuth = EmailAuth(
      sessionName: '',  // Initialize emailAuth in initState or constructor
      // serverDomain: 'https://your-production-server-url.com', // Replace with your server URL
      // serverKey: 'your_production_server_key', // Replace with your server key or credentials
    );
  }

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }


  /// [Authentication] - otpVerify ---------------------------------------------
  Future<void> sendOtp() async {
    try {
      bool result = await emailAuth.sendOtp(
        recipientMail: _emailController.text,
        otpLength: 5,
        // sessionName: "YourSessionName" // Add sessionName if required
      );
      if (result) {
        // OTP sent successfully
        print('OTP sent to ${_emailController.text}');
      } else {
        // Handle OTP sending failure
        print('Failed to send OTP');
      }
    } catch (e) {
      print('Error sending OTP: $e');
      // Handle error sending OTP
    }
  }


  Future<bool> verifyOTP() async {
    try {
      bool result = emailAuth.validateOtp(
        recipientMail: _emailController.text,
        userOtp: _verificationCodeController.text,
      );
      return result;
    } catch (e) {
      print('Error verifying OTP: $e');
      return false; // Return false indicating OTP verification failed
    }
  }


  String? validateVerificationCode(String? code) {
    if (code == null || code.isEmpty) {
      return 'Please enter the verification code';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bg_Color,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        backgroundColor: Bg_Color,
        title: const Text(
          'Forget Password',
          style: TextStyle(
              color: Color(0xff131313),
              fontSize: a_FontSize,
              fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 22,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  'Enter your email and we’ll send you a link to reset your password.',
                  style: TextStyle(
                    color: H_Color,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                ),
                const SizedBox(height: 25),

                // Form for Email Input and Verification Code
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Input
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'User@gmail.com',
                          hintStyle: const TextStyle(
                            color: Color(0xff8F8F8F),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.transparent), // Change border color here
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.transparent), // Change border color here
                          ),
                        ),
                        validator: validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),

                      if (_isButtonClicked)
                        Padding(
                          padding: const EdgeInsets.only(top: 25,left: 5,right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 58,
                                width: 54,
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    } else if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    hintStyle: TextStyle(
                                        color: const Color(0xff6750a4).withOpacity(0.4),
                                        fontSize: 18
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.3),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor.withOpacity(0.3),
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor,
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          width:2,
                                          color:const Color(0xff676767).withOpacity(0.3)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: PColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 58,
                                width: 54,
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    } else if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    hintStyle: TextStyle(
                                        color: const Color(0xff6750a4).withOpacity(0.4),
                                        fontSize: 18
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.3),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor.withOpacity(0.3),
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor,
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          width:2,
                                          color:const Color(0xff676767).withOpacity(0.3)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: PColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 58,
                                width: 54,
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    } else if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    hintStyle: TextStyle(
                                        color: const Color(0xff6750a4).withOpacity(0.4),
                                        fontSize: 18
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.3),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor.withOpacity(0.3),
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor,
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          width:2,
                                          color:const Color(0xff676767).withOpacity(0.3)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: PColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 58,
                                width: 54,
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    } else if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    hintStyle: TextStyle(
                                        color: const Color(0xff6750a4).withOpacity(0.4),
                                        fontSize: 18
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.3),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor.withOpacity(0.3),
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor,
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          width:2,
                                          color:const Color(0xff676767).withOpacity(0.3)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: PColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 58,
                                width: 54,
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    } else if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    hintStyle: TextStyle(
                                        color: const Color(0xff6750a4).withOpacity(0.4),
                                        fontSize: 18
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.3),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor.withOpacity(0.3),
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor,
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          width:2,
                                          color:const Color(0xff676767).withOpacity(0.3)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: PColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 58,
                                width: 54,
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    } else if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    hintStyle: TextStyle(
                                        color: const Color(0xff6750a4).withOpacity(0.4),
                                        fontSize: 18
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.3),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor.withOpacity(0.3),
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PColor,
                                          width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          width:2,
                                          color:const Color(0xff676767).withOpacity(0.3)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: PColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                    ],
                  ),
                ),

                // Button
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            if (!_isButtonClicked) {
                              // First click: Send OTP
                              await sendOtp();
                              setState(() {
                                _isButtonClicked = true;
                              });
                            } else {
                              // Second click: Verify OTP
                              bool otpVerificationResult = await verifyOTP();
                              if (otpVerificationResult) {
                                // OTP verified successfully
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const NewPassword()),
                                );
                              } else {
                                // OTP verification failed
                                print('Invalid OTP');
                                // Optionally show error message or retry OTP input
                              }
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.82,
                          decoration: BoxDecoration(
                            color: BtnColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              _isButtonClicked ? 'Verify OTP' : 'Send Verification Code',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  String password = '';
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
  void toggleShowPassword(){
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bg_Color,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        backgroundColor: Bg_Color,
        title: const Text(
          'Set New Password',
          style: TextStyle(
              color: Color(0xff131313),
              fontSize: a_FontSize,
              fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 22,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        centerTitle: true,
      ),

      //Set New Password
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 25.0,
              right: 25,
              top: MediaQuery.of(context).size.height*0.06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 90,
                    height: 90,
                    child: SvgPicture.asset('Assets/3d-Illustrator/Lock.svg')
                ),

                //Text
                const SizedBox(height: 25),
                Text('Set your password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: H_Color,
                  ),
                ),

                const SizedBox(height: 5),

                //Subtitle
                Text('Please create your new account password for PayKr',
                  style: TextStyle(
                    color: S_Color,
                    fontSize: 18,
                  ),
                  softWrap: true,
                ),

                //Password
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          onChanged: (value){
                            setState(() {
                              password = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off_rounded,
                                color: ActiveDotColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          onChanged: (value){
                            setState(() {
                              password = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Confirmed Password',
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off_rounded,
                                color: ActiveDotColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),

                        //Button
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40.0),
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: GestureDetector(
                                  onTap: (){
                                    if(_formKey.currentState!.validate()) {
                                      print('Email: ${_emailController.text}');
                                      print('Password: ${_passwordController.text}');
                                    }
                                    _formKey.currentState!.validate();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.82,
                                    decoration: BoxDecoration(
                                      color: BtnColor,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 15),
                                      child: Text(
                                        'Continue',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
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
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

