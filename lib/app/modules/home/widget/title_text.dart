import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(color: AppColors.pageBackground),
      child: Column(
        children: [
          Text(
            'Discover',
            style: const TextStyle(
                fontSize: 28,
                color: Color(0xFF021642),
                fontWeight: FontWeight.bold),
          ),
          Text(
            'New articles',
            style: const TextStyle(
                fontSize: 17,
                color: Color(0xFF021642),
                fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
