import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/values/app_values.dart';
import 'package:flutter_getx_template/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_getx_template/app/modules/home/widget/home_app_bar.dart';
import 'package:flutter_getx_template/app/modules/home/widget/item_tile.dart';
import 'package:flutter_getx_template/app/modules/home/widget/product_view.dart';
import 'package:flutter_getx_template/app/modules/home/widget/tab_bar.dart';
import 'package:get/get.dart';

import 'app_bar.dart';

class TabBarScreen extends StatefulWidget {
  HomeController? controller;

  @override
  TabBarScreen({required this.controller});

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void onTabTapped(int index) {
    print('tab index $index');
    setState(() {
      widget.controller?.activeTabIndex.value = index;
    });
  }

  List tabs = [
    {'title': 'Comedy'},
    {'title': 'Adventure'},
    {'title': 'Cosmos'},
    {'title': 'Winter Sports'},
    {'title': 'Special 60 '},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.index = widget.controller?.activeTabIndex.value ?? 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(),
      body: Obx(
        () => widget.controller != null &&
                    (widget.controller?.isProductLoaded.value)! ||
                (widget.controller?.products.isNotEmpty)!
            ? GridView.count(
                childAspectRatio: 9 / (9 + 9 - 5),
                shrinkWrap: true,
                children: List.generate(
                    (widget.controller?.products.length) ?? 0, (index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(ProductView(
                            product: widget.controller?.products[index]));
                      },
                      child: SizedBox(
                        height: AppValues.item_height,
                        child: ItemTile(
                            product: widget.controller?.products[index]),
                      ));
                }),
                crossAxisCount: 2,
              )
            : Center(
                child: Text('Loading...'),
              ),
      ),
    );
  }
}

//app bar

AppBar appBarCustom() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Stack(
      children: <Widget>[HomeAppBar()],
    ),
  );
}
