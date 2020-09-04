import 'package:flutter/material.dart';
import 'webView.dart';
import 'dart:math';

final _random = new Random();

Widget productCard(context, theme, product) {
  return Card(
    child: Column(
      children: [
        Container(
          constraints: BoxConstraints(minHeight: 200, maxWidth: 300),
          child: Column(
            children: [
              Image.asset(
                "assets/bgImage.jpeg",
                fit: BoxFit.fitWidth,
                height: 100,
                width: double.maxFinite,
                color: Colors.accents[_random.nextInt(Colors.accents.length)],
                colorBlendMode: BlendMode.colorBurn,
              ),
              ListTile(
                title: Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  product.company,
                  style: TextStyle(
                    color: theme.textTheme.bodyText2.color.withOpacity(0.6),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Starting at "),
                          TextSpan(
                              text: "\$${product.price}.99",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                        style: theme.textTheme.bodyText2,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => MyWebView(
                                  title: "More info: ${product.name}",
                                  selectedUrl: product.link,
                                )));
                      },
                      child: Text(
                        'MORE INFO',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: theme.primaryColor,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ],
    ),
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsets.all(10),
  );
}
