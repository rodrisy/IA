import 'package:flutter/material.dart';

class ToggleIconButton extends StatefulWidget {
  @override
  _ToggleIconButtonState createState() => _ToggleIconButtonState();
}

class _ToggleIconButtonState extends State<ToggleIconButton> {
  bool isSun = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: IconButton(
        key: Key(isSun.toString()),
        icon: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: isSun
              ? Icon(
                  Icons.wb_sunny,
                  color: Colors.yellow,
                )
              : Icon(
                  Icons.nightlight_round,
                  color: Colors.yellow,
                ),
        ),
        onPressed: () {
          setState(() {
            isSun = !isSun;
          });
        },
      ),
    );
  }
}
