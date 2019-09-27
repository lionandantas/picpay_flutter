import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PicPayImage extends StatelessWidget {
  final String imagem;
  final String url;
  final double width;
  final double height;
  final void Function() onPressed;

  PicPayImage({
    this.imagem,
    this.url,
    this.width = 50.0,
    this.height = 30.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            new Container(
              width: width,
              height: height,
              decoration: new BoxDecoration(
                  // Circle shape
                  shape: BoxShape.circle,
                  color: Colors.white,
                  // The border you want
                  border: new Border.all(
                    width: 2.0,
                    color: Colors.white,
                  ),
                  // The shadow you want
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/images/avatar_person.png'),
                  image: Image.asset(this.imagem).image,/*this.url == null && this.url.isEmpty
                      ? Image.asset(this.imagem).image
                      : CachedNetworkImageProvider(this.url),*/
                ),
              ),
            ),
          ],
        ));
  }
}
