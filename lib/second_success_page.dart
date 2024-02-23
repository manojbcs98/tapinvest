import 'package:flutter/material.dart';
import 'package:tap_invest_manoj/constants.dart';
import 'package:lottie/lottie.dart';

import 'contract_page.dart';

class SecondSuccessPage extends StatefulWidget {
  @override
  _SecondSuccessPageState createState() => _SecondSuccessPageState();
}

class _SecondSuccessPageState extends State<SecondSuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _loadWidgetAfterDelay();

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ContractPage(),
        ),
      );
    });
  }

  void _loadWidgetAfterDelay() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
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
            isLoading == true
                ? Padding(
                    padding: EdgeInsets.only(left: 140, top: 180),
                    child: Positioned(
                        child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xFF126631),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset('assets/file_written.png',
                              color: Colors.white),
                        ),
                      ],
                    )),
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 85, top: 180),
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
                          child: Image.asset('assets/file_written.png',
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        isLoading == false
                            ? Text(
                                'Generating Contract',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            : Text(''),
                        SizedBox(
                          height: 10,
                        ),
                        isLoading == false
                            ? Text(
                                'You are almost there!',
                                style: TextStyle(
                                    color: Color(0xFFA1CCB1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300),
                              )
                            : Text(''),
                        isLoading == false
                            ? Text(
                                'Do not leave the page or press the back button.',
                                style: TextStyle(
                                    color: Color(0xFFA1CCB1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300),
                              )
                            : Text('')
                      ],
                    )),
                  )
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
