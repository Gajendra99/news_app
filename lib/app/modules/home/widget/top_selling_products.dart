import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/values/app_values.dart';
import 'package:flutter_getx_template/app/data/model/products.dart';
import 'package:flutter_getx_template/app/modules/home/widget/card_item.dart';
import 'package:flutter_getx_template/app/modules/home/widget/item_tile.dart';
import 'package:flutter_getx_template/app/modules/home/widget/product_view.dart';
import 'package:get/get.dart';

class TopSellingProducts extends StatelessWidget {
  List<Product>? products;
  TopSellingProducts({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Selling Products',
                style: TextStyle(fontSize: 9 * 2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 9 + 2,
              ),
              Container(
                height: AppValues.card_height,
                width: Get.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9 + 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 9 + 8, top: 5, bottom: 8, left: 5),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(ProductView(product: products?[index]));
                          },
                          child: CardItem(product: products?[index])),
                    );
                  },
                ),
              ),
            ]));
  }
}
