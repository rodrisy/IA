import 'package:flutter/material.dart';
import 'package:schedule_app/models/schedules_model.dart';
import 'package:schedule_app/utils/colors.dart';
import 'package:schedule_app/utils/get_cycle_date.dart';
import 'package:schedule_app/utils/get_week_day.dart';
import 'package:schedule_app/widgets/class_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class DwightScheduleScreen extends StatefulWidget {
  @override
  _DwightScheduleScreenState createState() => _DwightScheduleScreenState();
}

class _DwightScheduleScreenState extends State<DwightScheduleScreen> {
  User? _currentUser;
  late DateTime selectedDate;
  late int indexDay;
  late String weekDay;

  @override
  void initState() {
    super.initState();
    selectedDate = calculateCurrentDay(DateTime.now(), 0);
    indexDay = calculateCycleDay(selectedDate, 6);
    weekDay = formatDateEEEE(selectedDate);

    // Initialize _currentUser based on the logged-in user ID.
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

  void _updateSelectedDate(int dayDifference) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: dayDifference));
      indexDay = calculateCycleDay(selectedDate, 6);
      weekDay = formatDateEEEE(selectedDate);
    });
  }

  int calculateIndexDay() {
    return calculateCycleDay(selectedDate, 6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgcolor,
      appBar: AppBar(
        backgroundColor: MyColors.bgcolor,
        title: Text("${weekDay}"),
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
                _updateSelectedDate(-1);
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                _updateSelectedDate(1);
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
    int indexDay = calculateCycleDay(selectedDate, 6);

    if (user == null) {
      return Text('User not found');
    } else if (user.schedules.length < indexDay && selectedDate.weekday > 5) {
      return Text("Today is ${weekDay}, no school today!");
    } else if (user.schedules.length < indexDay) {
      return Text('Schedule not found for this day\nToday is day: ${indexDay}');
    } else if (_currentUser!.schedules[indexDay - 1].classes.isEmpty) {
      return Text('No classes for this day');
    } else {
      return ListView(
        children: [
          Text("HELLO"),
          ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: user.schedules[indexDay - 1].classes.length,
              itemBuilder: (context, index) {
                var classInfo = user.schedules[indexDay - 1].classes[index];
                return ListTile(
                  contentPadding: EdgeInsets.only(bottom: 5),
                  subtitle: ClassContainer(
                    startTime: "${classInfo.startTime}",
                    endTime: "${classInfo.endTime}",
                    subject: "${classInfo.subject}",
                    teacher: "${classInfo.teacher}",
                    room: "${classInfo.room}",
                  ),
                );
              }),
        ],
      );
    }
  }
}
