import 'package:flutter/material.dart';
import 'package:tap_invest_manoj/constants.dart';
import 'package:tap_invest_manoj/table_model_data.dart';

Widget text1(TextStyle style1, TextStyle style2, double iconSize) {
  return Padding(
    padding: const EdgeInsets.only(left: 22.0, top: 20),
    child: Row(
      children: [
        Text('Agrizy', style: style1),
        SizedBox(
          width: 5,
        ),
        Icon(
          size: iconSize,
          Icons.arrow_back,
          color: Color(0xff807A75),
        ),
        SizedBox(
          width: 5,
        ),
        Text('Keshav Industries', style: style2),
      ],
    ),
  );
}

Widget text2() {
  return const Padding(
    padding: EdgeInsets.only(left: 18.0, top: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Agrizy offers solutions across digital vendor management and supply and value chain auto and additonal information such as Vending details',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Color(0xff78717C),
              fontWeight: FontWeight.w400,
              fontSize: 15),
        ),
      ],
    ),
  );
}

Widget getTable(List<TableModelData> data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Table(
      border: const TableBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        horizontalInside: BorderSide(width: 1, color: borderColor),
        verticalInside: BorderSide(width: 1, color: borderColor),
        bottom: BorderSide(width: 1, color: borderColor),
        top: BorderSide(width: 1, color: borderColor),
        left: BorderSide(width: 1, color: borderColor),
        right: BorderSide(width: 1, color: borderColor),
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(color: greyColor1),
          children: [
            buildTableCell(data[0].title, data[0].subTitle),
            buildTableCell(data[1].title, data[1].subTitle),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(color: greyColor1),
          children: [
            buildTableCell(data[2].title, data[2].subTitle),
            buildTableCell(data[3].title, data[3].subTitle),
          ],
        ),
      ],
    ),
  );
}

TableCell buildTableCell(String text1, String text2) {
  return TableCell(
    verticalAlignment: TableCellVerticalAlignment.top,
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 15),
      child: Container(
        height: 55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text1,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xff78717C),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text2,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget customSpacer() {
  return Divider(
    height: 2,
    color: greyColor,
  );
}

Widget header1(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              color: Color(0xFF45403C),
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/google.png', height: 80, width: 80),
              SizedBox(
                width: 20,
              ),
              Image.asset('assets/google.png', height: 80, width: 80),
              SizedBox(
                width: 20,
              ),
              Image.asset('assets/google.png', height: 80, width: 80),
            ],
          ),
        )
      ],
    ),
  );
}

Widget highLightText(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
          color: Color(0xFF45403C), fontSize: 18, fontWeight: FontWeight.w600),
    ),
  );
}

Widget nestedTextInsideContainer(IconData icon, {IconData? secondaryIcon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 330,
      height: 250,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: greyColor,
          width: 2,
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        secondaryIcon == null
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 30),
                child: Icon(
                  icon,
                  color: Color(0xFF86807A),
                  size: 24,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 30),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Color(0xFFE7E5E4), shape: BoxShape.circle),
                  child: Icon(
                    icon,
                    color: Color(0xFF86807A),
                    size: 24,
                  ),
                ),
              ),
        (secondaryIcon == null)
            ? const Text('')
            : const Padding(
                padding: EdgeInsets.only(top: 18.0, left: 10),
                child: Text(
                  'Invoice Discount',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF57544F),
                    fontSize: 15,
                  ),
                ),
              ),
        (secondaryIcon == null)
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Car or sport car is a vehicle with four wheels and is designed to carry a small number of people. Cars are used for a variety of purposes, including transportation, recreation, and business. Some people collect cars as a hobby, while others use them for racing or off-roading.',
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF86807A),
                    fontSize: 15,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 14.0, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Flexible(
                      child: Text(
                        'Car or sport car is a vehicle with four wheels and is designed to carry a small number of people. Cars are used for a variety of purposes, ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Icon(secondaryIcon,
                          size: 24, color: Color(0xFF86807A)),
                    )
                  ],
                ),
              ),
      ]),
    ),
  );
}
