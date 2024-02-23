import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest_manoj/all_done.dart';
import 'package:tap_invest_manoj/constants.dart';
import 'package:tap_invest_manoj/main.dart';

void main() {
  testWidgets('AllDone displays the correct widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AllDone(),
      ),
    );

    // Verify that the Lottie animation is displayed
    expect(find.byType(Lottie), findsOneWidget);

    // Verify that the flag image is displayed inside a container with the correct properties
    expect(
        find.descendant(
          of: find.byType(Container),
          matching: find.byType(Image),
        ),
        findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('All Done!'), findsOneWidget);
    expect(find.text('Redirecting you to the Dashbaord.'), findsOneWidget);
  });

  testWidgets('AllDone navigates to the dashboard after 7 seconds',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AllDone(),
      ),
    );

    await tester.pumpAndSettle();

    await tester.pump(const Duration(seconds: 1));
    Navigator.of(tester.element(find.byType(MaterialApp))).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );
  });
}
