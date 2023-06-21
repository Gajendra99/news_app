import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/values/app_values.dart';
import 'package:get/get.dart';

class AdsProductCrousal extends StatelessWidget {
  List<String> adsList;
  AdsProductCrousal({required this.adsList});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: CarouselSlider(
        disableGesture: true,
        options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlayCurve: Curves.easeInOutCirc,
            enlargeCenterPage: false,
            autoPlay: true,
            aspectRatio: (8 + 8 + 8 + 8) / 9),
        items: adsList.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppValues.tab_bar_item_radius),
                  child: Image.network("${image}"));
            },
          );
        }).toList(),
      ),
    );
  }
}
