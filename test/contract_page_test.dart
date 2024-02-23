import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tap_invest_manoj/contract_page.dart';

void main() {
  testWidgets('ContractPage displays the correct image and button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ContractPage(),
      ),
    );

    // Verify that the image is displayed
    expect(find.byKey(Key('image')), findsOneWidget);
    expect(
        find.descendant(
            of: find.byKey(Key('image')), matching: find.byType(Image)),
        findsOneWidget);

    // Verify that the button is displayed
    expect(find.byKey(Key('signContractButton')), findsOneWidget);
    expect(
        find.descendant(
            of: find.byKey(Key('signContractButton')),
            matching: find.byType(ElevatedButton)),
        findsOneWidget);

    // Verify that the button has the correct label
    expect(find.text('Sign Contract'), findsOneWidget);

    // Verify that the button has the correct background color
    final Finder buttonFinder = find.byKey(Key('signContractButton'));
    final ElevatedButton button = tester.widget<ElevatedButton>(buttonFinder);
    expect(button.style?.backgroundColor, Color(0xFF179645));
  });
}
