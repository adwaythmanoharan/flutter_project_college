import 'dart:io';
import 'package:college_event/user_page.dart';
import 'package:flutter/material.dart';
import 'package:college_event/event_creation.dart';
import 'package:college_event/event_details.dart';
import 'package:flutter/foundation.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  List<Map<String, String>> events = [];
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> filteredEvents =
        selectedCategory == "All"
            ? events
            : events.where((e) => e["department"] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color(0xffeef7ff),

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
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),

            ListTile(
  leading: const Icon(Icons.home),
  title: const Text("Home"),
  onTap: () {
    Navigator.pop(context); // closes the drawer and stays on Homescreen
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

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4a8cff),
        child: const Icon(Icons.add),
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
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, size: 40),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),

                  const Text(
                    "Campus Events",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserPage(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/pic.jpg"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// SEARCH BAR
              TextField(
                decoration: InputDecoration(
                  hintText: "Search events",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// CATEGORY CHIPS
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryChip("All"),
                    categoryChip("MCA"),
                    categoryChip("MBA"),
                    categoryChip("BCA"),
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

              /// EVENT LIST
              Expanded(
                child: filteredEvents.isEmpty
                    ? const Center(
                        child: Text(
                          "No events yet.\nClick + to create one",
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredEvents.length,
                        itemBuilder: (context, index) {

                          final event = filteredEvents[index];

                          return Card(
                            margin: const EdgeInsets.only(bottom: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [

                                /// EVENT IMAGE
                                ClipRRect(
                                  borderRadius:
                                      const BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                  child: event['image'] != null &&
                                          event['image']!.isNotEmpty
                                      ? Image.file(
                                          File(event['image']!),
                                          height: 160,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          "assets/college.jpg",
                                          height: 160,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                ),

                                Padding(
                                  padding:
                                      const EdgeInsets.all(12),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        event['title'] ?? "",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                              FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      Row(
                                        children: [
                                          const Icon(
                                              Icons.calendar_today,
                                              size: 14),
                                          const SizedBox(width: 5),
                                          Text(
                                              "${event['date']} • ${event['time']}"),
                                        ],
                                      ),

                                      const SizedBox(height: 4),

                                      Row(
                                        children: [
                                          const Icon(
                                              Icons.location_on,
                                              size: 14),
                                          const SizedBox(width: 5),
                                          Text(
                                              event['location'] ??
                                                  ""),
                                        ],
                                      ),

                                      const SizedBox(height: 10),

                                      Align(
                                        alignment:
                                            Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetailsPage(
                                                        event:
                                                            event),
                                              ),
                                            );

                                          },
                                          child: const Text(
                                              "View Details"),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget categoryChip(String text) {

    bool isSelected = selectedCategory == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },

      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 8),

        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xff4a8cff)
              : Colors.blue.shade100,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}