import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton({@required this.text, @required this.onTap, this.color});

  final Function onTap;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: this.color != null ? this.color : Colors.teal),
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TouchableOpacity extends StatefulWidget {
  TouchableOpacity({@required this.child, @required this.onTap});

  final Widget child;
  final Function onTap;

  @override
  State<StatefulWidget> createState() {
    return TouchableOpacityState();
  }
}

class TouchableOpacityState extends State<TouchableOpacity> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedOpacity(
        opacity: _isPressed ? 0.4 : 1.0,
        duration: Duration(milliseconds: 120),
        child: widget.child,
      ),
    );
  }
}
