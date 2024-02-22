class TableModelData {
  String title;
  String subTitle;

  TableModelData({required this.title, required this.subTitle});
}

firstTableContents() {
  List<TableModelData> data = [
    TableModelData(title: 'MIN INVT', subTitle: '₹ 1 Lakh'),
    TableModelData(title: 'TENURE', subTitle: '61 days'),
    TableModelData(title: 'NET YIELD', subTitle: '13.23 %'),
    TableModelData(title: 'RAISED', subTitle: '70%')
  ];
  return data;
}

oneTableContents() {
  List<TableModelData> data = [
    TableModelData(title: 'Active Deals', subTitle: '6 of 18'),
    TableModelData(title: 'Raised', subTitle: '₹ 1 Lakh'),
    TableModelData(title: 'Matured Deals', subTitle: '12 of 18'),
    TableModelData(title: 'On Time Payment', subTitle: '100%')
  ];
  return data;
}

twoTableContents() {
  List<TableModelData> data = [
    TableModelData(title: 'Active Deals', subTitle: '5 of 18'),
    TableModelData(title: 'Raised', subTitle: '₹ 2 Lakh'),
    TableModelData(title: 'Matured Deals', subTitle: '13 of 18'),
    TableModelData(title: 'On Time Payment', subTitle: '80%')
  ];
  return data;
}

threeTableContents() {
  List<TableModelData> data = [
    TableModelData(title: 'Active Deals', subTitle: '16 of 18'),
    TableModelData(title: 'Raised', subTitle: '₹ 5 Lakh'),
    TableModelData(title: 'Matured Deals', subTitle: '9 of 18'),
    TableModelData(title: 'On Time Payment', subTitle: '76%')
  ];
  return data;
}

Map<int, List<TableModelData>> resultMap = {
  0: oneTableContents(),
  1: twoTableContents(),
  2: threeTableContents(),
  3: oneTableContents(),
  4: twoTableContents()
};
