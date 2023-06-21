import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(color: AppColors.pageBackground),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.menu,
                color: Color(0xFF021642),
              ),
              iconSize: 35,
            ),
            Row(
              children: [
                Switch(
                    activeColor: const Color(0xFF021642),
                    value: true,
                    onChanged: null),
                IconButton(
                  icon: Icon(Icons.search, color: const Color(0xFF021642)),
                  // ignore: avoid_print
                  onPressed: () {
                    print('object');
                  },
                ),
                CircleAvatar(
                  child: Text('H'),
                  backgroundColor: const Color(0xFF021642),
                ),
              ],
            )
          ]),
    );
  }
}
