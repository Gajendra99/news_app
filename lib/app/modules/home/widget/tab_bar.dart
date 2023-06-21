import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/values/app_colors.dart';
import 'package:flutter_getx_template/app/core/values/app_values.dart';

class CustomTabBar extends StatelessWidget {
  final TabController? tabController;
  List? tabs;
  dynamic? changeTab;
  int? activeTab;

  CustomTabBar(
      {Key? key,
      this.tabController,
      required this.tabs,
      required this.activeTab,
      required this.changeTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TabBar(
        indicatorColor: Colors.transparent,
        isScrollable: true,
        controller: tabController,
        onTap: changeTab,
        tabs: List.generate(
            5,
            (index) => Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        color: activeTab == index
                            ? AppColors.app_active_color
                            : Colors.white,
                        border: Border.all(
                          color: activeTab != index
                              ? AppColors.app_active_color
                              : Colors.transparent,
                          width: 2.0, // Set the border width (optional)
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppValues.tab_bar_item_radius))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        '${tabs?[index]['title']}',
                        style: TextStyle(
                          color: activeTab != index
                              ? AppColors.app_active_color
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
