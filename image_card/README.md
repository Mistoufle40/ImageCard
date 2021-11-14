<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## Features

This widget is used to display a custom card with an image. There are a lot of 
customisable fields : 
- The background color
- The font color
- The border radius
- The padding
- The image position

Feature in progress : add a onTap field in order to do some actions when tap on the card


## Usage

Ther is a little example of the usage of this widget.

```dart
return Container (
  child: ImageCard(
    backgroundColor: Colors.blue,       // Required field
    subtitle: 'Subtitle of the card.',  // Required field
    image: 'assets/image.png',          // Required field
    title: 'Title of the card',         // Required field
    radius: 10,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    fontColor: Colors.white,
    imagePosition: ImagePos.left,
  ),
)

```

