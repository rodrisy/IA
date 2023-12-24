import 'package:flutter/material.dart';
import 'package:schedule_app/screens/schedule_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Schedule {
  final String day;
  final List<Class> classes;

  Schedule(this.day, this.classes);
}

class Class {
  final String startTime;
  final String endTime;
  final String subject;
  final String teacher;
  final String room;

  Class(this.startTime, this.endTime, this.subject, this.teacher, this.room);
}

class User {
  final String id;
  final List<Schedule> schedules;

  User(
    this.id,
    this.schedules,
  );
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.data == true) {
              return ScheduleScreen();
            } else {
              return LoginPage();
            }
          }
        },
      ),
    );
  }

  Future<bool> _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('student_id') != null;
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student ID"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'Enter Student ID'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('student_id', _idController.text);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ScheduleScreen()),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
