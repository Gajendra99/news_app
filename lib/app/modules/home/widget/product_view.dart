import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/values/app_colors.dart';
import 'package:flutter_getx_template/app/core/values/app_values.dart';
import 'package:flutter_getx_template/app/data/model/products.dart';
import 'package:flutter_getx_template/app/modules/home/widget/button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  Product? product;

  ProductView({required this.product}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Product')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              enableInfiniteScroll: false,
                              autoPlayCurve: Curves.easeInOutCirc,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 1 / 1),
                          items: product?.images.map((image) {
                            return Builder(
                              builder: (BuildContext context) {
                                return ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        AppValues.tab_bar_item_radius),
                                    child: Image.network("${image}"));
                              },
                            );
                          }).toList(),
                        ),
                      ),

                      // ClipRRect(
                      //     borderRadius: BorderRadius.circular(
                      //         AppValues.tab_bar_item_radius),
                      //     child: Image.network("${product?.images[0]}")),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width - Get.width / 4,
                            child: Text(
                              '${product?.title}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColors.app_active_color,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '₹ ${product?.price}',
                            style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.app_active_color,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      RatingBar.builder(
                        initialRating: 4,
                        ignoreGestures: true,
                        minRating: 1,
                        itemSize: AppValues.ratingStarSize,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${product?.description}',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.app_active_color,
                            fontWeight: FontWeight.normal),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.app_active_color,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.app_active_color,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.app_active_color,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    print('');
                    Get.back();
                  },
                )),
                Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: AppColors.app_active_color,
                        borderRadius: BorderRadius.circular(AppValues
                            .btn_radius), // Half of the width or height
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  AppValues.tab_bar_item_radius),
                              child: Image.network(
                                '${product?.category.image}',
                                width: AppValues.category_img_width,
                                height: AppValues.category_img_width,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${product?.category.name}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Button(
                    title: 'Buy Now',
                    borderColor: Colors.transparent,
                    onTap: () {
                      print('buy now tapped');
                    },
                    backgroundColor: AppColors.app_active_color,
                    txtColor: Colors.white,
                    width: Get.width / 2 - AppValues.btn_width_remove,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Button(
                    title: 'Add To Cart',
                    borderColor: AppColors.app_active_color,
                    onTap: () {
                      print('add to cart tapped');
                    },
                    backgroundColor: Colors.white,
                    txtColor: AppColors.app_active_color,
                    width: Get.width / 2 - AppValues.btn_width_remove,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
