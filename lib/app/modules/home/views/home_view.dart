import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/home/widget/ads_product_crousal.dart';
import 'package:flutter_getx_template/app/modules/home/widget/category_tabs.dart';
import 'package:flutter_getx_template/app/modules/home/widget/deal_of_the_day.dart';
import 'package:flutter_getx_template/app/modules/home/widget/home_app_bar.dart';
import 'package:flutter_getx_template/app/modules/home/widget/recommendations_tile.dart';
import 'package:flutter_getx_template/app/modules/home/widget/title_text.dart';
import 'package:flutter_getx_template/app/modules/home/widget/top_selling_products.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/core/widget/paging_view.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/home/widget/item_github_project.dart';

class HomeView extends BaseView<HomeController> {
  HomeView() {
    controller.getGithubGetxProjectList();
  }

  @override
  Widget body(BuildContext context) {
    // return TabBarScreen(
    //   controller: controller,
    // );
    return Scaffold(
      appBar: appBarCustom(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 9 + 1,
                ),
                AdsProductCrousal(adsList: controller.banners),
                SizedBox(
                  height: 9 + 9 + 4,
                ),
                Recommendations(),
                SizedBox(
                  height: 9 + 9 + 4,
                ),
                DealOfTheDay(),
                SizedBox(
                  height: 9 + 9 + 4,
                ),
                Obx(
                  () => controller.isProductLoaded.value
                      ? TopSellingProducts(products: controller.products)
                      : SizedBox.shrink(),
                )
              ]),
        ),
      ),
    );
  }
}

AppBar appBarCustom() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Stack(
      children: <Widget>[HomeAppBar()],
    ),
  );
}
