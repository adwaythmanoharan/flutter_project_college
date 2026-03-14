import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

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

  String selectedDepartment = "MCA";

  File? selectedImage;
  Uint8List? webImage;
  final ImagePicker picker = ImagePicker();

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

  Future<void> pickImage() async {
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {

    if (kIsWeb) {
      webImage = await image.readAsBytes();
    } else {
      selectedImage = File(image.path);
    }

    setState(() {});
  }
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
                decoration: const InputDecoration(labelText: "Event Name"),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: "Location"),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: participantsController,
                decoration: const InputDecoration(labelText: "Max Participants"),
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: selectedDepartment,
                decoration: const InputDecoration(labelText: "Department"),
                items: const [
                  DropdownMenuItem(value: "MCA", child: Text("MCA")),
                  DropdownMenuItem(value: "MBA", child: Text("MBA")),
                  DropdownMenuItem(value: "BCA", child: Text("BCA")),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: pickDate,
                child: Text(
                  selectedDate == null
                      ? "Select Date"
                      : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: pickTime,
                child: Text(
                  selectedTime == null
                      ? "Select Time"
                      : selectedTime!.format(context),
                ),
              ),

              const SizedBox(height: 20),

              selectedImage != null
                  ? Image.file(selectedImage!, height: 150)
                  : const Text("No image selected"),

              ElevatedButton(
                onPressed: pickImage,
                child: const Text("Select Event Image"),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    Navigator.pop(context, {
                      "title": titleController.text,
                      "description": descriptionController.text,
                      "location": locationController.text,
                      "participants": participantsController.text,
                      "department": selectedDepartment,
                      "date": selectedDate != null
                          ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                          : "",
                      "time": selectedTime != null
                          ? selectedTime!.format(context)
                          : "",
                      "image": selectedImage?.path ?? "",
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