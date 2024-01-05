import 'package:flutter/material.dart';

class ToggleIconButton extends StatefulWidget {
  @override
  _ToggleIconButtonState createState() => _ToggleIconButtonState();
}

class _ToggleIconButtonState extends State<ToggleIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isSun = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: IconButton(
        key: Key(isSun.toString()),
        icon: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _animation.value * 2 * 3.1415926535897932,
              child: child,
            );
          },
          child: isSun
              ? Icon(
                  Icons.wb_sunny,
                  color: Colors.yellow,
                )
              : Icon(
                  Icons.nightlight_round,
                  color: Colors.blue,
                ),
        ),
        onPressed: () {
          _controller.forward(from: 0.0);
          setState(() {
            isSun = !isSun;
          });
        },
      ),
    );
  }
}
