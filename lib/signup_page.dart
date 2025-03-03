import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordMatch = true;
  bool _isFormValid = false;
  bool _isEmailValid = true;

  void _validatePassword() {
    setState(() {
      _isPasswordMatch = _passwordController.text == _confirmPasswordController.text;
      _validateForm();
    });
  }

  void _validateForm() {
    setState(() {
      _isEmailValid = _validateEmail(_emailController.text);
      _isFormValid = _isEmailValid &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _isPasswordMatch;
    });
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  void _showInvalidEmailNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid email address'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showEmptyFieldsNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill in all fields'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 75),
              child: Image.asset(
                'assets/images/speclab.png',
              ),
            ),
            const SizedBox(height: 120),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Alexandria',
                          color: Color(0xFF381E72),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        width: 333,
                        height: 60,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDEDEA),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Color(0xFFB9B0B0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alexandria-Light'),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) => _validateForm(),
                        ),
                      ),
                      if (!_isEmailValid)
                        const Padding(
                          padding: EdgeInsets.only(top: 5, right: 170),
                          child: Text(
                            'Invalid email address',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 10,),
                      Container(
                        width: 333,
                        height: 60,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDEDEA),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Color(0xFFB9B0B0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alexandria-Light'),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              padding: const EdgeInsets.only(bottom: 5),
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: const Color(0xFFB9B0B0),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          onChanged: (value) => _validatePassword(),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        width: 333,
                        height: 60,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDEDEA),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextField(
                          controller: _confirmPasswordController,
                          obscureText: !_isConfirmPasswordVisible,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: const TextStyle(color: Color(0xFFB9B0B0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alexandria-Light'),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              padding: const EdgeInsets.only(bottom: 5),
                              icon: Icon(
                                _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: const Color(0xFFB9B0B0),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                          ),
                          onChanged: (value) => _validatePassword(),
                        ),
                      ),
                      if (!_isPasswordMatch)
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Passwords do not match",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 40,),
                      Container(
                        width: 333,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF1877F2),
                              Color(0xFF0E458C),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ElevatedButton(
                          onPressed: _isFormValid ? () {
                            if (!_isEmailValid) {
                              _showInvalidEmailNotification();
                            } else if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _confirmPasswordController.text.isEmpty) {
                              _showEmptyFieldsNotification();
                            } else {
                              Navigator.pushNamed(context, '/emailAdd');
                              print("Signup clicked");
                            }
                          } : () {
                            _showEmptyFieldsNotification();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Alexandria',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      const Text(
                        "or continue with",
                        style: TextStyle(
                          color: Color(0xFF645E5E),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alexandria-Light',
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        width: 333,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF1877F2),
                              Color(0xFF0E458C),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: OutlinedButton(
                            onPressed: () {
                              print("Continue with Google clicked");
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                width: 1.3,
                                color: Color(0xFF0E458C),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/google_logo.png',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(width: 10),
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      colors: [
                                        Color(0xFF1877F2),
                                        Color(0xFF0E458C),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds);
                                  },
                                  child: const Text(
                                    "Google",
                                    style: TextStyle(
                                      color: Color(0xFF0E458C),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Alexandria',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Already Have An Account? ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 172, 6, 6),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Alexandria-Light',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  color: Color(0xFF381E72),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Alexandria-Light',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}