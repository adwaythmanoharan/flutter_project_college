import 'package:college_event/user_page.dart';
import 'package:flutter/material.dart';
import 'payment_page.dart';
import 'dart:io';
import 'user_page.dart';

class EventDetailsPage extends StatelessWidget {

  final Map<String, String> event;

  const EventDetailsPage({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[100],

      /// DRAWER
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff4a8cff),
              ),
              child: Text(
                "Campus Events",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserPage(),
                  ),
                );
              },
            ),

          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        title: const Text(
          "Campus Events",
          style: TextStyle(
            color: Color.fromARGB(255, 8, 8, 8),
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/pic.jpg"),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// EVENT TITLE
              Text(
                event['title'] ?? "",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              /// DEPARTMENT
              Text(
                event['department'] ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 18),

              /// EVENT IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: event['image'] != null && event['image']!.isNotEmpty
                    ? Image.file(
                        File(event['image']!),
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/college.jpg",
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),

              const SizedBox(height: 30),

              /// DATE TIME
              Row(
                children: [
                  const Icon(Icons.calendar_today,
                      size: 30, color: Colors.blue),
                  const SizedBox(width: 10),
                  Text("${event['date']} • ${event['time']}"),
                ],
              ),

              const SizedBox(height: 12),

              /// LOCATION
              Row(
                children: [
                  const Icon(Icons.location_on,
                      size: 30, color: Colors.blue),
                  const SizedBox(width: 10),
                  Text(event['location'] ?? ""),
                ],
              ),

              const SizedBox(height: 20),

              /// DESCRIPTION
              Text(
                event['description'] ?? "",
                style: const TextStyle(fontSize: 15),
              ),

              const Divider(height: 40),

              /// PARTICIPANTS
              Row(
                children: [
                  const Icon(Icons.people_outline, color: Colors.blue),
                  const SizedBox(width: 10),
                  Text(
                    "${event['participants'] ?? "0"} Total student participation",
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),

              const SizedBox(height: 30),

              /// PARTICIPATE BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  onPressed: () {

                    showDialog(
                      context: context,
                      builder: (context) {

                        return AlertDialog(
                          title: const Text("Participation Confirmed"),
                          content: Text(
                            "You have successfully registered for ${event['title']}.",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("OK"),
                            )
                          ],
                        );
                      },
                    );

                  },

                  child: const Text(
                    "Participate in Event",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              /// FUND BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          eventName: event['title'] ?? "",
                        ),
                      ),
                    );

                  },

                  child: const Text(
                    "FUND EVENT",
                    style: TextStyle(fontSize: 16),
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