import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tap_invest_manoj/home_page.dart';

void main() {
  testWidgets('renders the app bar with the correct background color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
        ),
      ),
    );

    final appBarFinder = find.byType(AppBar);
    expect(appBarFinder, findsOneWidget);

    final appBar = tester.widget<AppBar>(appBarFinder);
    expect(appBar.backgroundColor, equals(Color(0xFF16803A)));
  });

  testWidgets('renders the body with the correct background color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );

    final bodyFinder = find.byType(SingleChildScrollView);
    expect(bodyFinder, findsOneWidget);

    final body = tester.widget<SingleChildScrollView>(bodyFinder);
    expect(body, equals(Color(0xFF16803A)));
  });

  testWidgets('renders the triangle with the correct color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );

    final triangleFinder = find.byType(CustomPaint);
    expect(triangleFinder, findsOneWidget);

    final triangle = tester.widget<CustomPaint>(triangleFinder);
    final trianglePainter = triangle.painter as TrianglePainter;
    expect(trianglePainter, equals(Color(0xFF7CD957)));
  });

  testWidgets('renders the correct number of table rows',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );

    final tableFinder = find.byType(Table);
    expect(tableFinder, findsNWidgets(2));
  });

  testWidgets('renders the correct number of list items',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );

    final listFinder = find.byType(ListView);
    expect(listFinder, findsNWidgets(2));
  });

  testWidgets('renders the correct number of gesture detectors',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );

    final gestureDetectorFinder = find.byType(GestureDetector);
    expect(gestureDetectorFinder, findsNWidgets(4));
  });
}
