import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paykr/Screen/Mobile/ForgetPass.dart';
import 'package:paykr/Screen/Mobile/SignUp.dart';
import 'package:paykr/Utilities/Color.dart';
import 'package:flutter/services.dart';
import '../../Utilities/BottomNav.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bg_Color,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09, //80
        backgroundColor: Bg_Color,
        elevation: 0.0,
        leading: GestureDetector(
          child: Container(
            child: const Icon(
              Icons.keyboard_arrow_left,
              size: 22,
              color: Colors.black,
            ),
          ),
          onTap: () {
            SystemNavigator.pop(); // Exit the app
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //Icon Color
        ),
        title: const Text(
          'Login',
          style: TextStyle(
              color: Color(0xff131313),
              fontSize: a_FontSize,
              fontWeight: FontWeight.w600),
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
                // Welcome Back
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: H_Color,
                  ),
                ),
                const SizedBox(height: 5),
                //Subtitle
                Text(
                  "Hey you're back, fill in your details to get back in",
                  style: TextStyle(
                    color: S_Color,
                  ),
                ),
                //Login Details
                LoginDetails(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LoginDetails extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginDetails({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  Future<void> signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.emailController.text,
          password: widget.passwordController.text,
        );
        // print("Signed in: ${userCredential.user?.email}");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NavBar()),
        );
        // Handle successful login, navigate to another screen
      } on FirebaseAuthException catch (e) {
        if (e.code =='user-not-found' ) {
          // Dialog Box
          _showErrorDialog('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          //Dialog Box
          _showErrorDialog('Failed Log In');
        } else {
          _showErrorDialog('Failed Log In');
        }

      } catch (e) {
        _showErrorDialog('Error signing in. Please try again later.');
      }
    }
  }

  //Dialog Box
  void _showErrorDialog(String message) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Container(
          width: double.infinity,
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.orange.withAlpha(90), width: 2),
            color: Colors.orange.withAlpha(20),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Icon(HugeIcons.strokeRoundedAlert01),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(message,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14
                        )
                      ),
                      Text(message,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          )
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(HugeIcons.strokeRoundedCancelCircle,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void toggleShowPassword() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              //Email Address
              TextFormField(
                controller: widget.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Color(0xff8F8F8F)),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
                validator: validateEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),
              //Password
              TextFormField(
                controller: widget.passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Color(0xff8F8F8F)),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.transparent),
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
              //Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp())),
                      child: const Text('New User'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPassword())),
                      child: Text(
                        'Forget Your Password',
                        style: TextStyle(
                          color: PColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Login Button
              GestureDetector(
                onTap: signIn,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.82,
                  decoration: BoxDecoration(
                    color: BtnColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
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