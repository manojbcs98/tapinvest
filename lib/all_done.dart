import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest_manoj/main.dart';

import 'constants.dart';

class AllDone extends StatefulWidget {
  const AllDone({Key? key}) : super(key: key);

  @override
  State<AllDone> createState() => _AllDoneState();
}

class _AllDoneState extends State<AllDone> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF16803C),
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Lottie.asset(
                'assets/Flow 1.json',
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 110, top: 180),
              child: Positioned(
                  child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFF126631),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/flag.png',
                        color: Colors.white, height: 20, width: 20),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'All Done!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Redirecting you to the Dashbaord.',
                    style: TextStyle(
                        color: Color(0xFFA1CCB1),
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )),
            )
          ],
        ));
    ;
  }
}
