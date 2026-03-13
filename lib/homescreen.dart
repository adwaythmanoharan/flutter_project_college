import 'package:flutter/material.dart';
import 'package:college_event/event_creation.dart';
import 'package:college_event/payment_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  List<Map<String, String>> events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef7ff),

      // Floating + button
     floatingActionButton: FloatingActionButton(
  backgroundColor: const Color(0xff4a8cff),
  onPressed: () async {

    final newEvent = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EventCreationPage(),
      ),
    );

    if (newEvent != null) {
      setState(() {
        events.add(newEvent);
      });
    }

  },
  child: const Icon(Icons.add),
),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.menu, size: 40),
                  Text(
                    "Campus Events",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/pic.jpg"),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search events",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Category filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryChip("All"),
                    CategoryChip("MCA"),
                    CategoryChip("MBA"),
                    CategoryChip("BCA"),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Ongoing Events",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),


              // Event cards list
             Expanded(
  child: ListView(
    children: events.map((event) {
      return Card(
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                event['title'] ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 6),
                  Text("${event['date']}  ${event['time']}"),
                ],
              ),

              const SizedBox(height: 5),

              Row(
                children: [
                  const Icon(Icons.location_on, size: 16),
                  const SizedBox(width: 6),
                  Text(event['location'] ?? ""),
                ],
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
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
  child: const Text("View Details"),
),
              ),

            ],
          ),
        ),
      );
    }).toList(),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String text;

  const CategoryChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Event image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: Image.asset(
              "assets/pic.jpg",
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "Tech Innovation Summit",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: const [
                    Icon(Icons.calendar_today, size: 14),
                    SizedBox(width: 5),
                    Text("Feb 28 • 10:00 AM"),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: const [
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text("City Campus Auditorium"),
                  ],
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () async {

  final newEvent = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const EventCreationPage(),
    ),
  );

  if (newEvent != null) {
    print(newEvent);
  }

},
                    child: const Text("View Details"),
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