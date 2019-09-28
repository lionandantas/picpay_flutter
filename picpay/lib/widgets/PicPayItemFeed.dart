import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:picpay/models/Payment.dart';
import 'package:picpay/widgets/PicPayImage.dart';

class PicPayItemFeed extends StatelessWidget {
  final Payment item;
  final void Function() onPressed;

  PicPayItemFeed({
    this.item,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        child: PicPayImage(
                          width: 45.0,
                          height: 45.0,
                          imagem: item.image,
                          onPressed: () {},
                        ),
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        item.username,
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(" pagou "),
                      Text(
                        "Você",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Text(item.mensage),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Text(
                        item.price,
                        style: TextStyle(
                            color: Color.fromARGB(255, 44, 207, 131),
                            fontWeight: FontWeight.w800),
                      ),
                      Text(" | "),
                      Icon(
                        Icons.people_outline,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Padding(child: Text(
                        item.time,
                        style: TextStyle(color: Colors.grey),
                      ),padding: EdgeInsets.only(left: 5.0),),
                      Spacer(),
                      Padding(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.chat_bubble_outline),
                            Text(item.commented.toString()),
                          ],
                        ),
                        padding: EdgeInsets.only(right: 5.0),
                      ),
                      Padding(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: Color.fromARGB(255, 44, 207, 131),
                            ),
                            Text(item.liked.toString()),
                          ],
                        ),
                        padding: EdgeInsets.only(left: 5.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
