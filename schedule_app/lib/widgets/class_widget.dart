import 'package:flutter/material.dart';
import 'package:schedule_app/utils/colors.dart';
import 'package:schedule_app/utils/fonts.dart';

// ClassContainer is a stateless widget
class ClassContainer extends StatelessWidget {
  // fonts stating
  final MyFonts myFonts = MyFonts();
  // Properties or parameters for the custom button
  // final int index;
  //
  final String startTime;
  final String endTime;
  final String subject;
  final String teacher;
  final String room;

  // Constructor to initialize properties
  ClassContainer({
    // required this.index,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.teacher,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    // Build method returns the UI representation of the widget
    return Container(
        width: 382,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: MyColors.aqua),
        child: Row(
          children: [
            //TIME
            Column(
              children: [
                Text(
                  "${startTime}",
                  style: myFonts.time,
                ),
                Text(
                  "${endTime}",
                  style: myFonts.time,
                ),
              ],
            ),
            //INFO
            Column(
              children: [
                Text(
                  "${subject}",
                  style: myFonts.subject,
                ),
                Text(
                  "${teacher}, ${room}",
                  style: myFonts.classinfo,
                )
              ],
            ),
          ],
        ));
  }
}
