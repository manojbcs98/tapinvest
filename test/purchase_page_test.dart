import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:tap_invest_manoj/purchase.dart';

void main() {
  testWidgets('renders PurchasePage with correct content',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PurchasePage()));

    // Verify that the app bar title is correct
    expect(find.text(''), findsOneWidget);

    // Verify that the purchasing text is correct
    expect(find.text('Purchasing'), findsOneWidget);

    // Verify that the input field is present and has the correct hint text
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Min 50,000'), findsOneWidget);

    // Verify that the total returns text is present
    expect(find.text('Total Returns'), findsOneWidget);

    // Verify that the net yield text is present
    expect(find.text('Net Yield'), findsOneWidget);

    // Verify that the balance and required texts are present
    expect(find.text('Balance: ₹1,00,000'), findsOneWidget);
    expect(find.text('Required: ₹0'), findsOneWidget);

    // Verify that the SlideAction button is present
    expect(find.byType(SlideAction), findsOneWidget);
  });

  testWidgets('displays error text when amount is less than 50,000',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PurchasePage()));

    // Enter an amount less than 50,000
    await tester.enterText(find.byType(TextField), '49,000');
    await tester.pump();

    // Verify that the error text is displayed
    expect(find.text('Please Enter Min 50000'), findsOneWidget);
  });

  testWidgets('calculates total returns correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PurchasePage()));

    // Enter an amount of 50,000
    await tester.enterText(find.byType(TextField), '50,000');
    await tester.pump();

    // Verify that the total returns is calculated correctly
    expect(find.text('Total Returns: ₹56,555'), findsOneWidget);
  });
}
