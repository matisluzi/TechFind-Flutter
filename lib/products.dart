import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

String csvRaw;
List<List<dynamic>> rowsAsListOfValues;

void loadCSV() async {
  WidgetsFlutterBinding.ensureInitialized();
  csvRaw = await rootBundle.loadString('assets/db.csv');
  rowsAsListOfValues = const CsvToListConverter().convert(csvRaw);
  for (var i = 1; i < rowsAsListOfValues.length; i++) {
    if (rowsAsListOfValues[i][0] != "" &&
        rowsAsListOfValues[i][1] != "" &&
        rowsAsListOfValues[i][2] != "" &&
        rowsAsListOfValues[i][3] != "" &&
        rowsAsListOfValues[i][4] != "") {
      products.add(Product(
        rowsAsListOfValues[i][0],
        rowsAsListOfValues[i][1],
        rowsAsListOfValues[i][2],
        rowsAsListOfValues[i][3].toString(),
        rowsAsListOfValues[i][4],
      ));
    }
  }
}

var productTypeNames = products.map((e) => e.type).toSet().toList();

class Product {
  String type;
  String name;
  String company;
  String price;
  String link;
  Product(this.type, this.name, this.company, this.price, this.link);
}

var products = <Product>[];

var productTypes = [
  ProductType("Phones", Icons.phone_iphone),
  ProductType("Laptops", Icons.laptop),
  ProductType("PCs", Icons.desktop_windows),
  ProductType("Headphones", Icons.headset),
  ProductType("Cases", Icons.error),
  ProductType("Power Banks", Icons.laptop),
  ProductType("Wireless Chargers", Icons.laptop),
];

class ProductType {
  String name;
  IconData icon;
  ProductType(this.name, this.icon);
}
