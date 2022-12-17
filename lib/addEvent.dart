import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';

class AddEvent extends StatefulWidget {
  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  var event = TextEditingController();

  var labelText = "Event";
  var selectedDate = "";

  Color labelColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Event"),
      ),
      body: Container(
        padding: const EdgeInsets.all(21),
        color: Colors.deepPurple[300],
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              style: const TextStyle(color: Colors.white, fontSize: 20),
              controller: event,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () async {
                    DateTime? eventDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2025));
                    selectedDate =
                        DateFormat.yMMMEd().format(eventDate!).toString();
                  },
                  icon: const Icon(Icons.event),
                  color: Colors.white,
                ),
                label: Text(
                  labelText,
                  style: TextStyle(color: labelColor),
                ),
                filled: true,
                fillColor: Colors.deepPurple,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.deepPurple)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: 100,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21))),
                onPressed: () {
                  if (event.text.toString() != "" && selectedDate != "") {
                    Navigator.of(context)
                        .pop([event.text.toString(), selectedDate]);
                  } else if (event.text.toString() != "" &&
                      selectedDate == "") {
                    setState(() {
                      labelText = "Select Date By Clickling Evnet Icon";
                      labelColor = Colors.red;

                      Timer(const Duration(seconds: 1), () {
                        setState(() {
                          labelText = "Event";
                          labelColor = Colors.white;
                        });
                      });
                    });
                  } else {
                    setState(() {
                      labelText = "Enter Some Event with Time";
                      labelColor = Colors.red;

                      Timer(const Duration(seconds: 1), () {
                        setState(() {
                          labelText = "Event";
                          labelColor = Colors.white;
                        });
                      });
                    });
                  }
                },
                child: const Text(
                  "Add",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
