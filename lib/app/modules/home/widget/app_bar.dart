import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Separate AppBar'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
