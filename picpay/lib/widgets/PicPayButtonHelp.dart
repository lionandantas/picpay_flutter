import 'package:flutter/material.dart';

class PicPayButtonHelp extends StatefulWidget {
  final void Function() onPressed;

  PicPayButtonHelp({
    @required this.onPressed,
  });

  @override
  _PicPayButtonHelpState createState() => _PicPayButtonHelpState();
}

class _PicPayButtonHelpState extends State<PicPayButtonHelp> {
  String img_up = "assets/images/ic_home_help.png";

  String img_dow = "assets/images/ic_home_help_white.png";

  String img;
  initState(){

    super.initState();
    img = 'assets/images/ic_home_help.png';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          img = img_dow;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          img = img_up;
        });
      },
      child: new Container(
        child: Image.asset(img, height: 35),
      ),
    );
  }
}
