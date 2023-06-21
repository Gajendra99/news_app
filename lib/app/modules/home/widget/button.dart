import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/values/app_values.dart';

class Button extends StatelessWidget {
  String? title;
  dynamic? onTap;
  Color? backgroundColor;
  Color? borderColor;
  Color? txtColor;
  double? width;

  Button(
      {required this.title,
      required this.onTap,
      required this.backgroundColor,
      required this.txtColor,
      required this.borderColor,
      required this.width})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: AppValues.btn_height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.white),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
                AppValues.btn_radius), // Half of the width or height
          ),
          child: Center(
            child: Text(
              '${title}',
              style: TextStyle(color: txtColor),
            ),
          ),
        ),
      ),
    );
  }
}
