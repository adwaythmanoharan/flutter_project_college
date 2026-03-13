import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {

  final String eventName;

  const PaymentPage({super.key, required this.eventName});

  void confirmPayment(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Payment Successful"),
          content: const Text("Your payment has been confirmed."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
                Navigator.pop(context); // go back to home
              },
              child: const Text("OK"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: const Color(0xff4a8cff),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "Event: $eventName",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Amount: ₹100",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 25),

              Image.asset(
                "assets/qr.png",
                height: 200,
              ),

              const SizedBox(height: 30),

             ElevatedButton(
  onPressed: () {
    confirmPayment(context);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xff4a8cff),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 12,
    ),
  ),
  child: const Text(
    "CONFIRM PAID",
    style: TextStyle(
      fontSize: 16,
      color: Colors.white,   // ← this makes text white
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