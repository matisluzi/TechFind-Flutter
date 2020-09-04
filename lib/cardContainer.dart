import 'package:flutter/material.dart';
import 'package:TechFind/products.dart';
import 'products.dart';
import 'card.dart';

Widget cardContainer(context, theme, ProductType type, List<Product> products) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: Row(
          children: [
            Icon(
              type.icon,
              size: 30,
            ),
            Spacer(),
            Text(
              type.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.body2.color,
              ),
            ),
            Spacer(flex: 20),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [for (var i in products) productCard(context, theme, i)],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
      )
    ],
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
  );
}
