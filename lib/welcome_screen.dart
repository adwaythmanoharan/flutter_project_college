import 'package:college_event/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef7ff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 20),

                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/pic.jpg",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.28,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Welcome to the",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),

                const Text(
                  "College Event App",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "In this app you can:",
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: 285,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bulletPoint("View College events"),
                      bulletPoint("Host College events"),
                      bulletPoint("Show participation"),
                      bulletPoint("Fund for event"),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homescreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4a8cff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Let's Get Started",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget bulletPoint(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        const Text("•", style: TextStyle(fontSize: 18, color: Colors.blue)),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    ),
  );
}