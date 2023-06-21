import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/values/app_values.dart';
import 'package:flutter_getx_template/app/data/model/products.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardItem extends StatelessWidget {
  Product? product;

  CardItem({required this.product});

  @override
  Widget build(BuildContext context) {
    //Generating random no for ratings
    Random random = Random();
    double starRating = random.nextInt(5) + 1;

    String title = (product?.title.length)! >= 15
        ? (product?.title.substring(0, 15))!
        : (product?.title)!;

    return Container(
      padding: EdgeInsets.all(9),
      width: AppValues.card_width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1 / 2), // Set the shadow color
            spreadRadius: 1, // Set the spread radius of the shadow
            blurRadius: 5, // Set the blur radius of the shadow
            offset: Offset(0, 2), // Set the offset of the shadow
          ),
        ],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                  width: AppValues.card_width - (9 * 5),
                  height: AppValues.card_width - (9 * 5 - 9 - 9),
                  child: Image.network("${product?.images[0]}")),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${title}', style: TextStyle(fontWeight: FontWeight.w600)),
                Icon(Icons.shopping_cart_outlined)
              ],
            ),
            SizedBox(
              height: 6,
            ),
            RatingBar.builder(
              initialRating: starRating,
              ignoreGestures: true,
              minRating: 1,
              itemSize: 9 + 6,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 1 / 2),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ]),
    );
  }
}
