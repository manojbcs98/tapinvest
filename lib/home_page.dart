import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest_manoj/purchase.dart';
import 'package:tap_invest_manoj/table_model_data.dart';
import 'package:tap_invest_manoj/text_helper.dart';
import 'constants.dart';

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
          leading: const Padding(
            padding: EdgeInsets.only(top: 26.0),
            child: Row(
              children: [
                BackButton(color: primaryColor),
              ],
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 30.0, right: 40),
            child: Text('Back to deals', style: TextStyle(color: primaryColor)),
          ),
          backgroundColor: backGroundColor,
        ),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 20),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor, width: 2),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0xFF7CD957),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF7CD957),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                  getTable(firstTableContents()),
                  customSpacer(),
                  header1('Clients'),
                  customSpacer(),
                  header1('Backed by'),
                  customSpacer(),
                  highLightText('Highlights'),
                  SizedBox(
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
                  customSpacer(),
                  highLightText('Key Metrics'),
                  SizedBox(
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
                            HapticFeedback.heavyImpact();
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
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getTable(tableData),
                  const SizedBox(height: 20),
                  customSpacer(),
                  highLightText('DOCUMENTS'),
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
              ),
            )));
  }

  Widget textFiedlEnter() {
    return TextField(
      enabled: true,
      onChanged: (String res) {},
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Enter text here',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: backGroundColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      /*decoration: InputDecoration(
              //labelText: 'Enter Amount (Min $minAmount)',
              hintText: '\$${minAmount.toString()}',
              //prefixText: '\$',
              suffixText: '${(_amount / 1000).round()}k',
            ),*/
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
                    Text('Filled'),
                    Text('30%'),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PurchasePage()));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: const BoxDecoration(
                        color: Color(0xff15803D),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: const Center(
                      child: Text("Tap to invest",
                          style: TextStyle(color: Colors.white)),
                    )),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
