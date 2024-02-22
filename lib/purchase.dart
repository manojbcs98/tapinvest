import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest_manoj/home_page.dart';
import 'package:tap_invest_manoj/table_model_data.dart';
import 'package:tap_invest_manoj/text_helper.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'animated_star.dart';
import 'constants.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'first_success_page.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  TextEditingController controller = TextEditingController();
  String interestAmount = '56,555';
  String errorText = '';
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backGroundColor,
        bottomNavigationBar: bottomBar(),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20),
            child: Container(
                height: 30,
                width: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: lightGreen),
                child: const BackButton(color: primaryColor)),
          ),
          title: const Padding(
            padding: EdgeInsets.only(
              top: 30.0,
            ),
            child: Text('', style: TextStyle(color: primaryColor)),
          ),
          backgroundColor: backGroundColor,
        ),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 22.0, top: 20),
                    child: Text('Purchasing',
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                  ),
                  text1(
                      TextStyle(
                          color: Color(0xff807A75),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      TextStyle(
                          color: Color(0xff807A75),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      18),
                  SizedBox(
                    height: 20,
                  ),
                  customSpacer(),
                  SizedBox(
                    height: 40,
                  ),
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'ENTER AMOUNT',
                      style: TextStyle(
                          color: Color(0xffA8A29E),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 0),
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 40,
                        child: TextField(
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                          inputFormatters: [
                            ThousandsSeparatorInputFormatter(),
                            LengthLimitingTextInputFormatter(12),
                          ],
                          textAlignVertical: TextAlignVertical.center,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          controller: controller,
                          autofocus: false,
                          cursorColor: Colors.black,
                          onChanged: (res) {
                            getComputation();
                          },
                          decoration: InputDecoration(
                              errorText: errorText,
                              errorStyle: const TextStyle(
                                  color: Color(0xFFc17235), fontSize: 12),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 0, left: 40),

                              // Adjust the padding around the text
                              hintText: 'Min 50,000',
                              hintStyle: const TextStyle(
                                  color: Color(0xffA8A29E),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: const Icon(
                                  color: Color(0xffA8A29E),
                                  Icons.currency_rupee_rounded,
                                  size: 25,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  totalReturns('Total Returns', '₹${interestAmount}'),
                  SizedBox(
                    height: 15,
                  ),
                  customSpacer(),
                  SizedBox(
                    height: 15,
                  ),
                  netYield(),
                  SizedBox(
                    height: 15,
                  ),
                  customSpacer(),
                  SizedBox(
                    height: 15,
                  ),
                  totalReturns('Tenure', '61 days'),
                ],
              ),
            )));
  }

  Widget netYield() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Net Yield', style: TextStyle(color: Color(0xFF54607F))),
          SizedBox(
            width: 10,
          ),
          Tooltip(
            triggerMode: TooltipTriggerMode.tap,
            message: 'Net Yield Information',
            textStyle: TextStyle(
              color: Colors.white,
            ),
            child: Text('IRR',
                style: TextStyle(
                    color: Color(0xFF16803C), fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            width: 3,
          ),
          Tooltip(
            triggerMode: TooltipTriggerMode.tap,
            message: 'Net Yield Information',
            textStyle: TextStyle(
              color: Colors.white,
            ),
            child: Icon(
              Icons.info_outline,
              size: 15,
              color: Color(0xFF16803C),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text('13.11%',
                style: TextStyle(color: Color(0xFF475568), fontSize: 17)),
          )
        ],
      ),
    );
  }

  void getComputation() {
    String temp = '';
    setState(() {
      if (controller.text.isNotEmpty) {
        if (controller.text.contains(',')) {
          temp = controller.text.replaceAll(",", '');
        }
        double value = double.parse(temp);
        print(value);
        if (value < 50000) {
          _focusNode.requestFocus();
          errorText = 'Please Enter Min 50000';
        } else if (value >= 50000) {
          errorText = '';
        }
      } else if (controller.text.isEmpty) {
        _focusNode.requestFocus();
        errorText = 'Please Enter Amount';
      } else {
        _focusNode.requestFocus();
        errorText = '';
      }
      interestAmount = smartCompute(temp);
    });
  }

  Widget totalReturns(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1, style: TextStyle(color: Color(0xFF54607F), fontSize: 17)),
          Text(text2, style: TextStyle(color: Color(0xFF475568), fontSize: 17)),
        ],
      ),
    );
  }

  String smartCompute(String input) {
    double a = double.tryParse(input) ?? 50000;
    var x = (a * 13.11) / 100;
    double y = a + x;
    String res = y.toString();
    if (res.length < 4) {
      return res;
    } else {
      double number = double.parse(res);
      String pattern = '#,##,##,###';
      NumberFormat formatter = NumberFormat(pattern);
      String output = formatter.format(number);
      return output;
    }
  }

  Widget bottomBar() {
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black12,
            width: 2.0,
          ),
        ),
      ),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 100, top: 10),
                child: Text('Balance: ₹1,00,000',
                    style: TextStyle(color: Color(0xFF807D79))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, top: 10),
                child: Text('Required: ₹0',
                    style: TextStyle(color: Color(0xFF807D79))),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: SlideAction(
                      onSubmit: controller.text.isNotEmpty
                          ? () {
                              HapticFeedback.heavyImpact();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FirstSuccessPage()));
                            }
                          : () {
                              setState(() {
                                _focusNode.requestFocus();
                                errorText = 'Please Enter Amount';
                              });
                            },
                      sliderRotate: false,

                      outerColor: Color(0xFFE7E5E4),
                      sliderButtonIconPadding: 14,
                      innerColor: Color(0xFF16803C),
                      //reversed: false,
                      elevation: 0,
                      borderRadius: 5,
                      height: 55,
                      child: const Center(
                        child: Text('SWIPE TO PAY',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    ));
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length < 4) {
      return newValue;
    }
    final number = int.parse(newValue.text.replaceAll(',', ''));
    final formatted = NumberFormat('#,##,###').format(number);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
