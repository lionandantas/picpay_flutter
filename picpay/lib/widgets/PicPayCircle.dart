import 'package:flutter/material.dart';
import 'package:picpay/models/User.dart';
import 'package:picpay/widgets/PicPayImage.dart';

class PicPayCircle extends StatelessWidget {
  final User user;
  final void Function() onPressed;

  PicPayCircle({
    @required this.user,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: new Material(
          child: new InkWell(
            onTap: onPressed,
            child: Column(
              children: <Widget>[
                PicPayImage(
                  onPressed: onPressed,
                  width: 70,
                  imagem: user.imagem,
                  url: "",
                  height: 70,
                ),
                SizedBox(
                  height: 1.0,
                ),
                Text(
                  user.name,
                  softWrap: true,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          color: Colors.transparent,
        ));
  }
}
