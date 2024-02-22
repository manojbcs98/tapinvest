import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tap_invest_manoj/all_done.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Image.asset('assets/contract.jpeg', width: 250, height: 400),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 140,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      HapticFeedback.vibrate();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AllDone()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(
                          0xFF179645), // Change the text color of the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Change the border radius of the button
                      ),
                    ),
                    child: Text(
                      'Sign Contract',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
