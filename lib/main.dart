import 'package:flutter/material.dart';
import 'package:tap_invest_manoj/constants.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black87, // Set your desired color here
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tap Invest Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(color: Colors.black87)),
      ),
      body: Center(
          child: SizedBox(
        width: 140,
        height: 40,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  Color(0xFF179645), // Change the text color of the button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10), // Change the border radius of the button
              ),
            ),
            child: Text(
              'See Inside',
              style: TextStyle(color: Colors.white),
            )),
      )),
    );
  }
}
