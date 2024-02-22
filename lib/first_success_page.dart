import 'package:flutter/material.dart';
import 'package:tap_invest_manoj/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest_manoj/second_success_page.dart';

class FirstSuccessPage extends StatefulWidget {
  @override
  _FirstSuccessPageState createState() => _FirstSuccessPageState();
}

class _FirstSuccessPageState extends State<FirstSuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isRotating = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isRotating = false;
      });
      _controller.stop();
    });
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SecondSuccessPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Visibility(
              visible: _isRotating == false,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Lottie.asset(
                  'assets/Flow 1.json',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: _isRotating ? 130 : 65.0, top: 180),
              child: Column(
                children: [
                  Positioned(
                      child: Column(
                    children: [
                      Container(
                          height: 120,
                          width: 126,
                          decoration: BoxDecoration(
                            color: Color(0xFF126631),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            child: _isRotating
                                ? RotationTransition(
                                    turns: Tween(begin: 0.0, end: 1.0)
                                        .animate(_controller),
                                    child: Image.asset('assets/brightness.png'),
                                  )
                                : Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Image.asset('assets/brightness.png'),
                                      Hero(
                                        tag: 'checked',
                                        child: Icon(Icons.check,
                                            size: 25, color: Color(0xFF257444)),
                                      ),
                                    ],
                                  ),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      _isRotating == false
                          ? Text(
                              'Payment done',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          : Text(''),
                      SizedBox(
                        height: 10,
                      ),
                      _isRotating == false
                          ? Text(
                              'You are almost there!',
                              style: TextStyle(
                                  color: Color(0xFFA1CCB1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            )
                          : Text(''),
                      _isRotating == false
                          ? Text(
                              'Do not leave the page or press the back button.',
                              style: TextStyle(
                                  color: Color(0xFFA1CCB1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            )
                          : Text(''),
                    ],
                  ))
                ],
              ),
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
