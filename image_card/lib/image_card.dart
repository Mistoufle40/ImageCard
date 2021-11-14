library image_card;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

enum ImagePos {
  right,
  left,
  topRight,
  topLeft,
  bottomRight,
  bottomLeft,
}

extension ImagePosition on ImagePos {
  AlignmentGeometry get position {
    switch (this) {
      case ImagePos.right:
        return Alignment.centerRight;
      case ImagePos.topRight:
        return Alignment.topRight;
      case ImagePos.bottomRight:
        return Alignment.bottomRight;
      case ImagePos.left:
        return Alignment.centerLeft;
      case ImagePos.topLeft:
        return Alignment.topLeft;
      case ImagePos.bottomLeft:
        return Alignment.bottomLeft;
      default:
        return Alignment.center;
    }
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    this.fontColor = Colors.white,
    this.imagePosition = ImagePos.right,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    this.radius = 5.0,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String image;
  final Color backgroundColor;
  final Color? fontColor;
  final ImagePos? imagePosition;
  final EdgeInsets? padding;
  final double? radius;

  bool isImageLeft() {
    if (imagePosition == ImagePos.left ||
        imagePosition == ImagePos.topLeft ||
        imagePosition == ImagePos.bottomLeft) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius!)),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              isImageLeft()
                  ? SizedBox(
                      child: Align(
                          alignment: imagePosition!.position,
                          //heightFactor: 1,
                          //widthFactor: 1,
                          child: Image.asset(
                            image,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Column(children: [
                                Image.asset(
                                  'assets/error.png',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                const Text('Image not found',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 10,
                                    ))
                              ]);
                            },
                          )),
                    )
                  : const SizedBox.shrink(),
              Flexible(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          style: TextStyle(
                            color: fontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(subtitle,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                color: fontColor,
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ]),
              ),
              isImageLeft()
                  ? const SizedBox.shrink()
                  : SizedBox(
                      child: Align(
                          alignment: imagePosition!.position,
                          heightFactor: 1,
                          widthFactor: 1,
                          child: Image.asset(
                            image,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Column(children: [
                                Image.asset(
                                  'assets/error.png',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                const Text('Image not found',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 10,
                                    ))
                              ]);
                            },
                          )),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
