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
    TableModelData(title: 'one table', subTitle: '₹ 1 Lakh'),
    TableModelData(title: 'Tenure', subTitle: '61 days'),
    TableModelData(title: 'Net Yield', subTitle: '13.23 %'),
    TableModelData(title: 'Raised', subTitle: '70%')
  ];
  return data;
}

twoTableContents() {
  List<TableModelData> data = [
    TableModelData(title: 'two table', subTitle: '₹ 1 Lakh'),
    TableModelData(title: 'Tenure', subTitle: '61 days'),
    TableModelData(title: 'Net Yield', subTitle: '13.23 %'),
    TableModelData(title: 'Raised', subTitle: '70%')
  ];
  return data;
}

threeTableContents() {
  List<TableModelData> data = [
    TableModelData(title: 'three table', subTitle: '₹ 1 Lakh'),
    TableModelData(title: 'Tenure', subTitle: '61 days'),
    TableModelData(title: 'Net Yield', subTitle: '13.23 %'),
    TableModelData(title: 'Raised', subTitle: '70%')
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
