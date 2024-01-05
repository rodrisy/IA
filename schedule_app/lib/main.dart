import 'package:flutter/material.dart';
import 'package:schedule_app/screens/dwightschedule_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/schedules_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.data == true) {
              return DwightScheduleScreen();
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student ID"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'Enter Student ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'invalid ID. please enter some text';
                  } else if (!busers.any((user) => user.id == value)) {
                    return 'invalid ID. the ID entered is not in database';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('student_id', _idController.text);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DwightScheduleScreen()),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
