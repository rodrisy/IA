import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/models/schedules_model.dart';
import 'package:schedule_app/utils/get_cycle_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  User? _currentUser;

  @override
  void initState() {
    super.initState();

    // Initialize _currentUser based on the logged-in user ID
    SharedPreferences.getInstance().then((prefs) {
      String? userId = prefs.getString('student_id');
      if (userId != null) {
        User? foundUser =
            users.firstWhere((user) => user.id == userId, orElse: null);
        setState(() {
          _currentUser = foundUser;
        });
      }
    });
  }

// FIND DAY
  int dayDifference = 0;
  today = DateTime.now();
  DateTime currentDay = calculateCurrentDay(today, dayDifference);
  String dayWords = dayToWords(currentDay);
  String dayWeekday = dayToWeekday(currentDay);
  int indexDay = calculateCycleDay(currentDay, 6);

////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${todayWeekday}"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('student_id');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _currentUser != null
            ? _buildSchedule(_currentUser, indexDay)
            : Text('User not found'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  indexDay = indexDay - 1;
                  while (indexDay < 0) {
                    indexDay += 6;
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                setState(() {
                  indexDay += 1;
                  while (indexDay > 6) {
                    indexDay -= 6;
                  }
                  ;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // implement logic to add a new class
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildSchedule(User? user, int indexDay) {
    if (user == null || user.schedules.length <= indexDay - 1) {
      return Text('Schedule not found for this day\nToday is day: ${indexDay}');
    } else if (user.schedules[indexDay - 1].classes.isEmpty) {
      return Text('No classes for this day');
    } else {
      return ListView.builder(
        itemCount: user.schedules[indexDay - 1].classes.length,
        itemBuilder: (context, index) {
          var classInfo = user.schedules[indexDay - 1].classes[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text(
              'Day ${indexDay}',
            ),
            subtitle: Container(
              width: 300,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${classInfo.startTime} - ${classInfo.endTime}: ${classInfo.subject} with ${classInfo.teacher} in ${classInfo.room}',
              ),
            ),
          );
        },
      );
    }
  }
}
