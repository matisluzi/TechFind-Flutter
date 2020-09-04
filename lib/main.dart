// ignore: unused_import
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'products.dart';
import 'cardContainer.dart';

void main() async {
  // read csv file
  // ignore: await_only_futures
  await loadCSV();

  // only run app after reading csv
  runApp(TechFindApp());
}

class TechFindApp extends StatefulWidget {
  @override
  _TechFindAppState createState() => _TechFindAppState();
}

class _TechFindAppState extends State<TechFindApp> {
  int sortingType = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // APP THEME
      theme: ThemeData(
        // for light mode
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeDelta: 2,
            ),
      ),
      // dark mode theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
      title: "TechFind",

      // APP LAYOUT
      home: Scaffold(
        // nav bar
        appBar: AppBar(
          title: Text("TechFind"),
          leading: PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: Text("Sort by product company"),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Text("Sort by product name"),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text("Sort by price - ascending"),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text("Sort by price - descending"),
                    ),
                  ],
              child: Icon(Icons.sort),
              onSelected: (i) {
                setState(() {
                  switch (i) {
                    case 0:
                      products.sort((a, b) => a.company.compareTo(b.company));
                      break;
                    case 1:
                      products.sort((a, b) => a.name.compareTo(b.name));
                      break;
                    case 2:
                      products.sort((a, b) =>
                          int.parse(a.price).compareTo(int.parse(b.price)));
                      break;
                    case 3:
                      products.sort((a, b) =>
                          int.parse(b.price).compareTo(int.parse(a.price)));
                      break;
                  }
                });
              }),
        ),
        // app body
        body: Builder(
          builder: (context) => new Column(
            children: [
              Expanded(
                // vertical scroll view
                child: ListView(
                  children: [
                    for (var i in productTypes)
                      cardContainer(
                        context,
                        Theme.of(context),
                        i,
                        products
                            .where((element) => element.type == i.name)
                            .toList(),
                      )
                  ],
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
