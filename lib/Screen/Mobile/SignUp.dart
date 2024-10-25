import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paykr/Auth/auth_service.dart';
import 'package:paykr/Utilities/Color.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userController = TextEditingController();
  final _contactController = TextEditingController();

  // bool roundTrip = true;
  final _auth = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bg_Color,

      //AppBar
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.09, //80
        backgroundColor: Bg_Color,
        title: const Text('Sign Up',
          style: TextStyle(
              color: Color(0xff131313),
              fontSize: a_FontSize,
              fontWeight: FontWeight.w600
          ),
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

      //Body
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //Welcome to PayKr
                Text('Welcome to PayKr',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: H_Color,
                  ),
                ),
                const SizedBox(height: 5),

                //Subtitle
                Text('Complete the sign up to get started',
                  style: TextStyle(
                    color: S_Color,
                  ),
                ),


                //Sign Up Details
                const SignUpDetails(),


                //Register Button
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                             // await _registerUser();
                              await _auth.createUserWithEmailAndPassword(
                                  _emailController.text, _passwordController.text
                              );
                            }
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
                                'Register',
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
          )
        ],
      ),
    );
  }
}

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({super.key});

  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  String password = '', email = '', name = '', contact = '';
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool roundTrip = true;


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Email Validation
  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return "Please enter a valid email";
    }
    return null;
  }

  void toggleShowPassword(){
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 0,right:0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),

              //UserName
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'User Name',
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
              const SizedBox(height: 16),

              //Email Address
              TextFormField(
                controller: _emailController,
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
                validator: validateEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),

              //Contact
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(
                  hintText: 'Contact No.',
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
              const SizedBox(height: 16),

              //Password
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
              const SizedBox(height: 25),

              //Policy
              const PolicyChecker(),
            ],
          ),
        ),
      ),
    );
  }
}



/* This Section is for Agreement CheckBox for Policy Checker  */
class PolicyChecker extends StatefulWidget {
  const PolicyChecker({super.key});

  @override
  _PolicyCheckerState createState() => _PolicyCheckerState();
}

class _PolicyCheckerState extends State<PolicyChecker> {
  bool _isPolicyChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              value: _isPolicyChecked,
              onChanged: (value) {
                setState(() {
                  _isPolicyChecked = value!;
                  if (!_isPolicyChecked) {
                    print('cHECK PRIVACK ');
                  }
                });
              },
              activeColor: BtnColor,
              checkColor: Colors.white,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: GestureDetector(
                onTap: !_isPolicyChecked
                    ? () {
                  // Handle onTap here, e.g., open a URL or navigate to a new screen.
                  // Example: launchURL('https://example.com/terms');
                }
                    : null,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Color(0xff131313),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      const TextSpan(
                        text: 'By signing up, you agree to the ',
                      ),
                      TextSpan(
                        text: 'Terms of Service and Privacy Policy',
                        style: const TextStyle(
                          color: Color(0xff2C14DD),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = !_isPolicyChecked
                              ? () {
                            // Handle tap on "Terms of Service and Privacy Policy"
                            // Example: launchURL('https://example.com/terms');
                          }
                              : null,
                      ),
                    ],
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}









