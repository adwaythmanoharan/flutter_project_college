import 'package:college_event/homescreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeef7ff),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/pic.jpg",
                  width: double.infinity,
                  //height: 209,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Welcome to the",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),

              const SizedBox(height: 0.5),

              const Text(
                "College Event App",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 60),

              /*Align(
                alignment: Alignment.centerLeft,
                child: Text("In this app you can:")
                ),*/


                Center(
                    child: SizedBox(
                        width: 278,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[Text("In this app you can")],
                        ),
                    ),
                ),

              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 285, // controls how far from the left it starts
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
              ),

              const Spacer(),

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
