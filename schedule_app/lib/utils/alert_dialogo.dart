import 'dart:ui';

import 'package:flutter/material.dart';

void _showCustomAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Custom Alert'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('This is a custom alert message.'),
            SizedBox(height: 10),
            Text(
              'You can customize the content as needed.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the alert
            },
          ),
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              // Perform action when OK is pressed
              Navigator.of(context).pop(); // Close the alert
            },
          ),
        ],
      );
    },
  );
}
