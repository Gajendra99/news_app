import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/values/app_values.dart';
import 'package:flutter_getx_template/app/data/model/products.dart';
import 'package:get/get.dart';

class ItemTile extends StatelessWidget {
  Product? product;

  ItemTile({required this.product}) : super();

  @override
  Widget build(BuildContext context) {
    String titleTxt = (product!.title.length >= 50)
        ? (product?.title.substring(0, 50))!
        : product!.title;

    return SizedBox(
      width: Get.width - 9 - 9 - 9,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              product?.images[0] ?? '',
              width: Get.width,
              height: AppValues.item_height,
              fit: BoxFit.contain,
              // height: AppValues.item_height,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 0, left: 8, right: 8),
              child: Text(
                titleTxt,
                style: TextStyle(fontSize: 6 * 2, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ " + product!.price.toString() ?? '',
                      style: TextStyle(
                          fontSize: 6 * 3, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: null, icon: Icon(Icons.favorite_outline))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
