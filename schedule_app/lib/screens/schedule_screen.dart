import 'package:flutter/material.dart';
import 'package:schedule_app/models/class_model.dart';
import 'package:schedule_app/models/schedules_model.dart';
import 'package:schedule_app/utils/get_cycle_date.dart';
import 'package:schedule_app/utils/get_week_day.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../utils/colors.dart';
import '../utils/fonts.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final MyFonts myFonts = MyFonts();

  User? _currentUser;
  late DateTime selectedDate;
  late int indexDay;
  late String weekDay;
  late String dayLink;

  @override
  void initState() {
    super.initState();
    selectedDate = calculateCurrentDay(DateTime.now(), 0);
    indexDay = calculateCycleDay(selectedDate, 6);
    weekDay = formatDateEEEE(selectedDate);
    dayLink = formatDateMMMMDD(selectedDate);

    // Initialize _currentUser based on the logged-in user ID.
    SharedPreferences.getInstance().then((prefs) {
      String? userId = prefs.getString('student_id');
      User? foundUser;

      if (userId != null) {
        // If userId is not null, try to find a matching user
        foundUser = users.firstWhere((user) => user.id == userId);
      }
      setState(() {
        _currentUser = foundUser;
      });
    });
  }

  void _updateSelectedDate(int dayDifference) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: dayDifference));
      indexDay = calculateCycleDay(selectedDate, 6);
      weekDay = formatDateEEEE(selectedDate);
      dayLink = formatDateMMMMDD(selectedDate);
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
        title: Text(
          "${weekDay}",
          style: myFonts.appbar,
        ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Center(
          child: _currentUser != null
              ? _buildSchedule(_currentUser, indexDay)
              : Text(
                  'User not found',
                  style: myFonts.weekday,
                ),
        ),
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

    if (selectedDate.weekday > 5) {
      return Text(
        "Today is ${weekDay}, no school today!",
        style: myFonts.classinfo,
      );
    } else if (user == null || user.schedules.length <= indexDay) {
      return Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${weekDay}",
                    style: myFonts.weekday,
                  ),
                  Text(
                    "Day ${indexDay}",
                    style: myFonts.dayindex,
                  ),
                ],
              ),
              Text(
                "${dayLink}",
                style: myFonts.daylink,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
                "Schedule not found for this day \n Today is day: ${indexDay}"),
          )
        ],
      );
    } else if (user.schedules[indexDay].classes.isEmpty) {
      return Text(
        'No classes for this day',
        style: myFonts.classinfo,
      );
      // } else if (selectedDate == (DateTime)) {
      //   return Text(
      //     "Today theres no school",
      //     style: myFonts.classinfo,
      //   );

      /// for days with vacation and no school
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "${weekDay}",
                      style: myFonts.weekday,
                    ),
                    Text(
                      "Day ${indexDay}",
                      style: myFonts.dayindex,
                    ),
                  ],
                ),
                Text(
                  "${selectedDate}",
                  style: myFonts.daylink,
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: user.schedules[indexDay].classes.length,
              itemBuilder: (context, index) {
                var classInfo = user.schedules[indexDay].classes[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    'Day ${indexDay + 1}',
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
            ),
          ],
        ),
      );
    }
  }
}
