import 'package:flutter/material.dart';
import 'package:schedule_app/models/schedules_model.dart';
import 'package:schedule_app/utils/colors.dart';
import 'package:schedule_app/utils/fonts.dart';
import 'package:schedule_app/utils/get_cycle_date.dart';
import 'package:schedule_app/utils/get_week_day.dart';
import 'package:schedule_app/widgets/class_widget.dart';
import 'package:schedule_app/widgets/notification_button.dart';
import 'package:schedule_app/widgets/toggle_icon_button.dart';
import 'package:schedule_app/widgets/toggle_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../models/class_model.dart';

class DwightScheduleScreen extends StatefulWidget {
  @override
  _DwightScheduleScreenState createState() => _DwightScheduleScreenState();
}

class _DwightScheduleScreenState extends State<DwightScheduleScreen> {
  // fonts stating
  final MyFonts myFonts = MyFonts();

  User? _currentUser;
  BUser? _currentBUser;
  late DateTime selectedDate;
  late int indexDay;
  late String weekDay;
  late String exactDate;

  @override
  void initState() {
    super.initState();
    selectedDate = calculateCurrentDay(DateTime.now(), 0);
    indexDay = calculateCycleDay(selectedDate, 6);
    weekDay = formatDateEEEE(selectedDate);
    exactDate = formatDateMMMMDD(selectedDate);

    // Initialize _currentUser based on the logged-in user ID.
    SharedPreferences.getInstance().then((prefs) {
      String? userId = prefs.getString('student_id');
      // if (userId != null) {
      //   User? foundUser =
      //       users.firstWhere((user) => user.id == userId, orElse: null);
      //   setState(() {
      //     _currentUser = foundUser;
      //   });
      // }

      if (userId != null) {
        BUser? foundBUser =
            busers.firstWhere((user) => user.id == userId, orElse: null);
        setState(() {
          _currentBUser = foundBUser;
        });
      }
    });
  }

  void _updateSelectedDate(int dayDifference) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: dayDifference));
      indexDay = calculateCycleDay(selectedDate, 6);
      weekDay = formatDateEEEE(selectedDate);
      exactDate = formatDateMMMMDD(selectedDate);
    });
  }

  int calculateIndexDay() {
    return calculateCycleDay(selectedDate, 6);
  }

  // i dont even know what this does at this point :/
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyColors.bgcolor,
      appBar: AppBar(
        backgroundColor: MyColors.bgcolor,
        title: Text("Dwight 23-24"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.settings)),
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
      drawer: Drawer(
          // Drawer content goes here
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ToggleSwitch(),
        ToggleIconButton(),
        NotificationButton(),
      ])),
      body: Center(
        child: _currentBUser != null || _currentUser != null
            ? _buildSchedule(_currentUser, indexDay, _currentBUser)
            : Text('User not found abc'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                _updateSelectedDate(-1);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
              ),
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
          _showCustomAlert(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildSchedule(User? user, int indexDay, BUser? buser) {
    int indexDay = calculateCycleDay(selectedDate, 6);

    if (user == null && buser == null) {
      return Text('User not found');
      // } else if (user.schedules.length < indexDay && selectedDate.weekday > 5) {
      //   return Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      //       child: Column(children: [
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             //weekday and dayindex
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   '${weekDay}',
      //                   style: myFonts.weekday,
      //                 ),
      //                 Text(
      //                   "Day ${indexDay}",
      //                   style: myFonts.dayindex,
      //                 )
      //               ],
      //             ),
      //             // week exact
      //             Text(
      //               "${exactDate}",
      //               style: myFonts.daylink,
      //             ),
      //           ],
      //         ),
      //         Expanded(child: SizedBox()),
      //         Text(
      //           "Today is ${weekDay}, no school today!",
      //           style: myFonts.dayindex,
      //         ),
      //         Expanded(child: SizedBox()),
      //       ]));
      // } else if (user.schedules.length < indexDay) {
      //   return Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             //weekday and dayindex
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   '${weekDay}',
      //                   style: myFonts.weekday,
      //                 ),
      //                 Text(
      //                   "Day ${indexDay}",
      //                   style: myFonts.dayindex,
      //                 )
      //               ],
      //             ),
      //             // week exact
      //             Text(
      //               "${exactDate}",
      //               style: myFonts.daylink,
      //             )
      //           ],
      //         ),
      //         Expanded(child: SizedBox()),
      //         Text(
      //           'Schedule not found for this day\nToday is day: ${indexDay}',
      //           style: myFonts.dayindex,
      //         ),
      //         Expanded(child: SizedBox()),
      //       ],
      //     ),
      //   );
      // } else if (_currentUser!.schedules[indexDay - 1].classes.isEmpty) {
      //   return Text('No classes for this day');
    } else if (true) {
      return ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //weekday and dayindex
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${weekDay}',
                    style: myFonts.weekday,
                  ),
                  Text(
                    "Day ${indexDay}",
                    style: myFonts.dayindex,
                  )
                ],
              ),
              // week exact
              Text(
                "${exactDate}",
                style: myFonts.daylink,
              )
            ],
          ),
          ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              // schedules[1] is 11th grader schedule
              // schedules[0] is test1 retard
              itemCount: schedules[1].days[indexDay - 1].blocks.length,
              itemBuilder: (context, index) {
                var blockInfo = schedules[1].days[indexDay - 1].blocks[index];
                var classInfo = buser?.blockDictionary[
                    schedules[1].days[indexDay - 1].blocks[index].letter];
                //

                //
                // if the current period is lunch time!
                if (blockInfo.letter != 'lunch')
                  return ListTile(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    subtitle: ClassContainer(
                      color: classColorsList[index],
                      startTime: "${blockInfo.startTime}",
                      endTime: "${blockInfo.endTime}",
                      subject: "${classInfo?.subject}",
                      teacher: "${classInfo?.teacher}",
                      room: "${classInfo?.room}",
                    ),
                  );
                if (blockInfo.letter == 'lunch')
                  return ListTile(
                      contentPadding: EdgeInsets.only(bottom: 5),
                      subtitle: ClassContainer(
                        color: classColorsList[index],
                        startTime: "${blockInfo.startTime}",
                        endTime: "${blockInfo.endTime}",
                        subject: "${blockInfo.letter}",
                        teacher: "",
                        room: "",
                      ));
              })
        ],
      );
    }
  }

  Widget _dwight11body(User? user, int indexDay, BUser? buser) {
    int indexDay = calculateCycleDay(selectedDate, 6);
    //
    BlockSchedule grade11Schedule = schedules[1];

    BlockDay day6 = grade11Schedule.days[5];

    Block blockH = day6.blocks.firstWhere((block) => block.letter == 'h');
    //
    switch (indexDay) {
      case 1:
        // return Column(
        //   children: [
        //     ClassContainer(
        //         startTime: "${schedules[1].days[0].blocks[0].startTime}",
        //         endTime: "${schedules[1].days[0].blocks[0].endTime}",
        //         subject:
        //             "${buser?.blockDictionary[schedules[1].days[0].blocks[0].letter]?.subject ?? ''}",
        //         teacher:
        //             "${buser?.blockDictionary[schedules[1].days[0].blocks[0].letter]?.teacher ?? ''}",
        //         room:
        //             "${buser?.blockDictionary[schedules[1].days[0].blocks[0].letter]?.room ?? ''}",
        //         color: MyColors.aqua)
        //   ],
        // );
        return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: schedules[1].days[indexDay - 1].blocks.length,
            // schedules[1] is the schedule for 11th graders dummy
            // schedules[0] is the schedule for test1 fucking dumbass
            itemBuilder: (context, index) {
              var blockInfo = schedules[1].days[indexDay - 1].blocks[index];
              var classInfo = buser?.blockDictionary[
                  schedules[1].days[indexDay - 1].blocks[index].letter];
              return ListTile(
                contentPadding: EdgeInsets.only(bottom: 5),
                subtitle: ClassContainer(
                  color: classColorsList[index],
                  startTime: "${blockInfo.startTime}",
                  endTime: "${blockInfo.endTime}",
                  subject: "${classInfo?.subject ?? ''}",
                  teacher: "${classInfo?.teacher ?? ''}",
                  room: "${classInfo?.room ?? ''}",
                ),
              );
            });
      case 2:
        return Container(
          color: Colors.orange,
          child: Center(
            child: Text('day 2'),
          ),
        );
      case 3:
        return Container(
          color: Colors.green,
          child: Center(
            child: Text('day 3'),
          ),
        );
      case 4:
        return Container(
          color: Colors.amber,
          child: Text('dsay 4'),
        );
      default:
        return Container(
          child: Text('defsault either day 5 or six'),
        );
    }
  }

  void _showCustomAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'This button does absolutely nothing.',
            style: TextStyle(fontSize: 30),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'For your own mental stability, do not press again.\n For your own mental stability, do not press again.\n For your own mental stability, do not press again.\n For your own mental stability, do not press again.\n For your own mental stability, do not press again.\nFor your own mental stability, do not press again.\n For your own mental stability, do not press again.\n For your own mental stability, do not press again.\n For your own mental stability, do not press again.\n For your own mental stability, do not press again.\n For your own mental stability, do not press again.\n',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'okay yes, my bad',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert
              },
            ),
          ],
        );
      },
    );
  }
}
