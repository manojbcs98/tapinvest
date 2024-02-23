import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest_manoj/purchase.dart';
import 'package:tap_invest_manoj/table_model_data.dart';
import 'package:tap_invest_manoj/text_helper.dart';
import 'constants.dart';
import 'second_success_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> _selectedIndex = [0];
  List<TableModelData> tableData = firstTableContents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        bottomNavigationBar: bottomBar(),
        appBar: AppBar(
          elevation: 0,
          surfaceTintColor: backGroundColor,
          scrolledUnderElevation: 0.0,
          leading: const Padding(
            padding: EdgeInsets.only(
              top: 26.0,
            ),
            child: Row(
              children: [
                BackButton(color: primaryColor),
              ],
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 35.0, right: 20),
            child: Text('Back to Deals',
                style: TextStyle(
                    color: Color(0xFF16803A),
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
          ),
          backgroundColor: backGroundColor,
        ),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 25),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 3),
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF7CD957),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 3),
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF7CD957),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(2),
                                  bottomRight: Radius.elliptical(10, 5),
                                  topRight: Radius.elliptical(10, 5)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 0),
                          child: CustomPaint(
                            painter: TrianglePainter(),
                            child: Container(
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                text1(
                    const TextStyle(
                        color: Color(0xff152420),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    const TextStyle(
                        color: Color(0xff78717C),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    20),
                SizedBox(
                  height: 5,
                ),
                text2(),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 10),
                  child: getTable(firstTableContents()),
                ),
                customSpacer(),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: header1('Clients'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: header1('Backed by'),
                ),
                customSpacer(),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: highLightText('Highlights'),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 250,
                    child: ListView.separated(
                      separatorBuilder: (c, i) {
                        return const SizedBox(
                          width: 15,
                        );
                      },
                      itemCount: 3,
                      itemBuilder: (context, int i) {
                        return nestedTextInsideContainer(Icons.lightbulb_sharp);
                      },
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                customSpacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: highLightText('Key Metrics'),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (c, i) {
                        return SizedBox(
                          width: 15,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (c, i) {
                        return GestureDetector(
                          onTap: () {
                            HapticFeedback.vibrate();
                            setState(() {
                              _selectedIndex = [i];
                              tableData = resultMap[i]!;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: _selectedIndex[0] == i ? 120 : 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: _selectedIndex[0] == i
                                  ? primaryColor
                                  : buttonGreyColor,
                              borderRadius: BorderRadius.circular(
                                  6), // set the button border radius
                            ),
                            child: Center(
                              child: Text(
                                '${map[i]}',
                                style: TextStyle(
                                    color: _selectedIndex[0] == i
                                        ? Colors.white
                                        : Color(0xff78716C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 10),
                  child: getTable(tableData),
                ),
                const SizedBox(height: 20),
                customSpacer(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: highLightText('Documents'),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: nestedTextInsideContainer(Icons.file_copy,
                      secondaryIcon: Icons.arrow_circle_down),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: nestedTextInsideContainer(Icons.cable_outlined,
                      secondaryIcon: Icons.arrow_circle_down),
                ),
                const SizedBox(
                  height: 200,
                )
              ],
            )));
  }

  Widget textFiedlEnter() {
    return TextField(
      enabled: true,
      onChanged: (String res) {},
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Enter text here',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: backGroundColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
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
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Padding(
                padding: EdgeInsets.only(right: 120, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('FILLED',
                        style: TextStyle(
                            color: Color(0xFFB2B2B2),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    Text('30%  ',
                        style: TextStyle(
                            color: Color(0xFF374151),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ],
                )),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 13, top: 15),
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.vibrate();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PurchasePage()));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: const BoxDecoration(
                        color: Color(0xff15803D),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: const Center(
                      child: Text("Tap to Invest",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    )),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF7CD957)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..quadraticBezierTo(size.width / 4, size.height / 2, 0, size.height)
      ..quadraticBezierTo(
          size.width / 2, 3 * size.height / 4, size.width, size.height)
      ..quadraticBezierTo(
          3 * size.width / 4, size.height / 2, size.width / 2, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
