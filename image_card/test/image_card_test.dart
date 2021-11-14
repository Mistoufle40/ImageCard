import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_card/image_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget _boilerplate({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  Finder _findText(String text) {
    return find.text(text);
  }

  Finder _findKey(String text) {
    return find.byKey(Key(text));
  }

  const title = 'Title';
  const subtitle = 'This is a new subtitle for the test card';
  const image = 'assets/innovation.png';

  group('Card tests', () {
    testWidgets('Card loads', (WidgetTester tester) async {
      await tester.pumpWidget(
        _boilerplate(
          child: const ImageCard(
              key: Key('specialCard'),
              title: title,
              subtitle: subtitle,
              image: image,
              backgroundColor: Colors.red),
        ),
      );

      expect(_findKey('specialCard'), findsOneWidget);
    });

    testWidgets('Card control valid text', (WidgetTester tester) async {
      await tester.pumpWidget(
        _boilerplate(
          child: const ImageCard(
              key: Key('specialCard'),
              title: title,
              subtitle: subtitle,
              image: image,
              backgroundColor: Colors.red),
        ),
      );

      expect(_findKey('specialCard'), findsOneWidget);
      expect(_findText(title), findsOneWidget);
      expect(_findText(subtitle), findsOneWidget);
    });

    testWidgets('Card control incorrect text', (WidgetTester tester) async {
      await tester.pumpWidget(
        _boilerplate(
          child: const ImageCard(
              key: Key('specialCard'),
              title: title,
              subtitle: subtitle,
              image: image,
              backgroundColor: Colors.red),
        ),
      );

      expect(_findKey('specialCard'), findsOneWidget);
      expect(_findText(title + ' null'), findsNothing);
      expect(_findText(subtitle + 'non'), findsNothing);
    });

    testWidgets('Card display correct image', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(
        child: const ImageCard(
          key: Key('specialCard'),
          title: title,
          subtitle: subtitle,
          image: image,
          backgroundColor: Colors.red,
        ),
      ));

      expect(_findKey('specialCard'), findsOneWidget);

      // Check the avatar circle in the
      final Image _image = find.byType(Image).evaluate().single.widget as Image;

      // Test image asset name
      expect((_image.image as AssetImage).assetName, image);
    });

    testWidgets('Card image not found throws error',
            (WidgetTester tester) async {
          await tester.pumpWidget(_boilerplate(
            child: const ImageCard(
              key: Key('specialCard'),
              title: title,
              subtitle: subtitle,
              image: 'assets/incorrect_path.png',
              backgroundColor: Colors.red,
            ),
          ));

          expect(_findKey('specialCard'), findsOneWidget);

          // Check if error text exist
          final findsError = _findText('Image not found');
          await tester.pump();
          expect(findsError, findsOneWidget);
        });

    testWidgets('Card background color and text test',
            (WidgetTester tester) async {
          await tester.pumpWidget(_boilerplate(
            child: const ImageCard(
              key: Key('specialCard'),
              title: title,
              subtitle: subtitle,
              image: 'assets/incorrect_path.png',
              backgroundColor: Colors.red,
              fontColor: Colors.white,
            ),
          ));

          // Get container for the card
          var _container = find.byType(Container);
          expect(_container, findsOneWidget);

          // Get decoration for the card
          var _textStyle = _findText(title);
          expect(_textStyle, findsOneWidget);

          // Test backgroundColor for the card
          expect(
              ((tester.firstWidget(find.byType(Container)) as Container).decoration
              as BoxDecoration)
                  .color,
              Colors.red);
          // Test fontColor for the card
          expect(
              ((tester.firstWidget(find.text(title)) as Text).style as TextStyle)
                  .color,
              Colors.white);
        });

    testWidgets('Card radius test', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(
        child: const ImageCard(
          key: Key('specialCard'),
          title: title,
          subtitle: subtitle,
          image: 'assets/incorrect_path.png',
          backgroundColor: Colors.red,
          radius: 10,
        ),
      ));

      // Get container for the card
      var _container = find.byType(Container);
      expect(_container, findsOneWidget);

      // Test radius for the card
      expect(
          ((tester.firstWidget(find.byType(Container)) as Container).decoration
          as BoxDecoration)
              .borderRadius,
          BorderRadius.circular(10));
    });

    testWidgets('Card image position test', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(
        child: const ImageCard(
          key: Key('specialCard'),
          title: title,
          subtitle: subtitle,
          image: 'assets/incorrect_path.png',
          backgroundColor: Colors.red,
          imagePosition: ImagePos.left,
        ),
      ));

      // Get align widget
      var _align = find.byType(Align);
      expect(_align, findsOneWidget);

      // Test imagePosition for the card
      expect((tester.firstWidget(find.byType(Align)) as Align).alignment,
          Alignment.centerLeft);
    });

    testWidgets('Card padding test', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(
        child: const ImageCard(
          key: Key('specialCard'),
          title: title,
          subtitle: subtitle,
          image: 'assets/incorrect_path.png',
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 20),
        ),
      ));

      // Get container for the card
      var _container = find.byType(Container);
      expect(_container, findsOneWidget);

      // Test imagePosition for the card
      expect((tester.firstWidget(find.byType(Container)) as Container).padding,
          const EdgeInsets.symmetric(horizontal: 20));
    });
  });
}
