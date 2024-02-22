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

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  TextEditingController controller = TextEditingController();
  String interestAmount = '56555';
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
                width: 30,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: lightGreen),
                child: BackButton(color: primaryColor)),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 20),
                    child: const Text('Purchasing',
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
                    padding: EdgeInsets.only(left: 20.0),
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
                    padding: const EdgeInsets.only(left: 30.0, top: 0),
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 40,
                        child: TextField(
                          inputFormatters: [
                            // IndianNumberFormatInputFormatter(),
                          ],
                          textAlignVertical: TextAlignVertical.center,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          controller: controller,
                          autofocus: false,
                          cursorColor: Colors.black,
                          onChanged: (res) {
                            setState(() {
                              if (controller.text.isNotEmpty) {
                                double value = double.parse(controller.text);
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
                              interestAmount = smartCompute(res);
                            });
                          },
                          decoration: InputDecoration(
                              errorText: errorText,
                              errorStyle: TextStyle(color: Colors.red),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 0),

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
                  RotatingStar()
                ],
              ),
            )));
  }

  Widget netYield() {
    return Padding(
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
    return y.toString();
  }

  Widget bottomBar() {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
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
                      onSubmit: () {
                        HapticFeedback.heavyImpact();
                        /*    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));*/
                      },
                      sliderRotate: false,

                      outerColor: Color(0xFFE7E5E4),
                      sliderButtonIconPadding: 14,
                      innerColor: Color(0xFF16803C),
                      //reversed: false,
                      elevation: 0,
                      borderRadius: 5,
                      height: 55,
                      child: Center(
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

class IndianNumberFormatInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    int selectionIndex = newValue.selection.end;
    String cleanText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    String formattedValue = _formatAsIndianNumber(cleanText);

    // Adjust the selection index based on the formatted value
    if (oldValue.text.length < newValue.text.length) {
      selectionIndex += formattedValue.length - cleanText.length;
    } else {
      selectionIndex -= cleanText.length - formattedValue.length;
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(
          offset: selectionIndex.clamp(0, formattedValue.length)),
    );
  }

  String _formatAsIndianNumber(String input) {
    String result = '';
    int len = input.length;
    int groups = (len / 2).ceil();
    for (int i = 0; i < groups; i++) {
      int endIndex = len - i * 2;
      int startIndex = (endIndex - 2).clamp(0, len);
      result = input.substring(startIndex, endIndex) +
          (result.isEmpty ? '' : ',') +
          result;
    }
    return result;
  }
}
