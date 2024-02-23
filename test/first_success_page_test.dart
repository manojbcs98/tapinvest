import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest_manoj/first_success_page.dart';
import 'package:tap_invest_manoj/second_success_page.dart';

void main() {
  testWidgets('FirstSuccessPage displays correct widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FirstSuccessPage(),
    ));

    // Verify that the initial screen with the rotating icon is displayed
    expect(find.byType(Stack), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(RotationTransition), findsOneWidget);

    // Wait for the animation to complete
    await tester.pumpAndSettle();

    // Verify that the final screen with the checkmark is displayed
    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.byType(Lottie), findsOneWidget);
    expect(find.byType(Padding), findsOneWidget);
    expect(find.text('Payment done'), findsOneWidget);
    expect(find.text('You are almost there!'), findsOneWidget);
    expect(find.text('Do not leave the page or press the back button.'),
        findsOneWidget);

    // Navigate to the second success page
    await tester.pumpAndSettle(Duration(seconds: 10));
    expect(find.byType(SecondSuccessPage), findsOneWidget);
  });
}
