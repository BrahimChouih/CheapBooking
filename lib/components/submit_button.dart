import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function onTap;

  const SubmitButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Icon(Icons.check, color: Colors.white),
        decoration: BoxDecoration(
          color: Color(0xff00C6EB),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0xff00C6EB),
              offset: Offset(0, 4),
              blurRadius: 15,
              spreadRadius: -5,
            ),
          ],
        ),
      ),
    );
  }
}
