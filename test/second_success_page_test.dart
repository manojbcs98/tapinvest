import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest_manoj/second_success_page.dart';
import 'package:tap_invest_manoj/constants.dart';

void main() {
  testWidgets('SecondSuccessPage displays correct widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SecondSuccessPage(),
    ));

    // Verify that the Lottie animation is displayed
    expect(find.byType(Lottie), findsOneWidget);

    // Verify that the loading widget is displayed initially
    expect(find.byType(Positioned), findsOneWidget);
    expect(
        find.descendant(
            of: find.byType(Positioned), matching: find.byType(Container)),
        findsOneWidget);

    // Wait for the loading widget to disappear
    await tester.pumpAndSettle();

    // Verify that the non-loading widget is displayed
    expect(find.text('Generating Contract'), findsOneWidget);
    expect(find.text('You are almost there!'), findsOneWidget);
    expect(find.text('Do not leave the page or press the back button.'),
        findsOneWidget);
  });
}
