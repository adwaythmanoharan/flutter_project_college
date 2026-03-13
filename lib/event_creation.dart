import 'package:flutter/material.dart';

class EventCreationPage extends StatefulWidget {
  const EventCreationPage({super.key});

  @override
  State<EventCreationPage> createState() => _EventCreationPageState();
}

class _EventCreationPageState extends State<EventCreationPage> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController participantsController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  void createEvent() {

    Navigator.pop(context, {
      "title": titleController.text,
      "location": locationController.text,
      "description": descriptionController.text,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Event"),
        backgroundColor: const Color(0xff4a8cff),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [

              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Event Name",
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  labelText: "Location",
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: participantsController,
                decoration: const InputDecoration(
                  labelText: "Max Participants",
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: pickDate,
                      child: Text(
                        selectedDate == null
                            ? "Select Date"
                            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: pickTime,
                      child: Text(
                        selectedTime == null
                            ? "Select Time"
                            : selectedTime!.format(context),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
  onPressed: () {

    Navigator.pop(context, {
  "title": titleController.text,
  "location": locationController.text,
  "date": selectedDate != null
      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
      : "",
  "time": selectedTime != null
      ? selectedTime!.format(context)
      : "",
});

  },
  child: const Text("Submit Event"),
),
              ),

            ],
          ),
        ),
      ),
    );
  }
}