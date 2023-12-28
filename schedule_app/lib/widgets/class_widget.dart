import 'package:flutter/material.dart';

// ClassContainer is a stateless widget
class ClassContainer extends StatelessWidget {
  // Properties or parameters for the custom button
  final int index;
  //
  final String color;
  //
  final String startTime;
  final String endTime;
  final String subject;
  final String teacher;
  final String room;

  // Constructor to initialize properties
  const ClassContainer(
      {required this.index,
      required this.startTime,
      required this.endTime,
      required this.subject,
      required this.teacher,
      required this.room,
      required this.color});

  @override
  Widget build(BuildContext context) {
    // Build method returns the UI representation of the widget
    return Container(
      width: 382,
      height: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
    );
  }
}
