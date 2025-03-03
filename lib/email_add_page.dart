import 'package:flutter/material.dart';

class EmailAddPage extends StatelessWidget {
  const EmailAddPage({super.key});

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
            const SizedBox(height: 450),
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
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        "Email Address",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Alexandria',
                          color: Color(0xFF381E72),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft, // Align to the right
                        child: const Text(
                          "Please enter your email address.",
                          style: TextStyle(
                            color: Color(0xFF645E5E),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alexandria-Light',
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 333,
                        height: 60,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDEDEA),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "sample@gmail.com",
                            hintStyle: TextStyle(color: Color(0xFFB9B0B0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alexandria-Light'),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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
                          onPressed: () {
                            print("Verify clicked");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: const Text(
                            "Verify",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Alexandria',
                            ),
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