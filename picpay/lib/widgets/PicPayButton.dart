import 'package:flutter/material.dart';

class PicPayButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color colorText;
  final Color colorBackground;

  PicPayButton({
    @required this.text,
    @required this.onPressed,
    @required this.colorText,
    @required this.colorBackground,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      onPressed: this.onPressed,
      color: colorBackground,
      child: Text(
        text,
        style: TextStyle(
          color: colorText,
          fontFamily: 'Robo',
          fontSize: 16.0,
        ),
      ),
    );
  }
}
