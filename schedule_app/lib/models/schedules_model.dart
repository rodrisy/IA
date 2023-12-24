import '../main.dart';

List<User> users = [
  User(
    '0001',
    [
      Schedule(
        'Day 1',
        [
          Class('8:00 AM', '9:00 AM', 'Math', 'Mr. Johnson', 'Room 101'),
          Class('9:05 AM', '10:00 AM', 'History', 'Ms. Smith', 'Room 202'),
          Class('10:05 AM', '11:00 AM', 'English', 'Mrs. Brown', 'Room 303'),
          Class('11:05 AM', '12:00 PM', 'Lunch', '', ''),
          Class('12:05 PM', '1:00 PM', 'Science', 'Dr. White', 'Lab 1'),
          Class('1:05 PM', '2:00 PM', 'Physical Ed', 'Coach Davis', 'Gym'),
          Class('2:05 PM', '3:00 PM', 'Art', 'Mrs. Turner', 'Art Studio'),
        ],
      ),

      // Add more schedules for user 0001 as needed
    ],
  ),
  // Add more users and their schedules as needed
];
