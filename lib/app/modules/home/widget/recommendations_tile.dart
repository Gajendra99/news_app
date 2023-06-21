import 'package:flutter/material.dart';

class Recommendations extends StatelessWidget {
  // Recommendations({});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommendations',
              style: TextStyle(fontSize: 9 * 2, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                rec_tile("Today's Deals", Icons.handshake),
                rec_tile("Laptop", Icons.laptop),
                rec_tile("Accessories", Icons.headphones),
                rec_tile("Women's Special", Icons.woman_rounded),
                rec_tile("Kids Special", Icons.child_friendly),
                rec_tile("Men's Special", Icons.man),
              ]),
            )
          ]),
    );
  }
}

Widget rec_tile(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1 / 2), // Set the shadow color
            spreadRadius: 1, // Set the spread radius of the shadow
            blurRadius: 5, // Set the blur radius of the shadow
            offset: Offset(0, 2), // Set the offset of the shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 9 + 5, vertical: 6),
      child: Column(
        children: [
          Icon(icon),
          SizedBox(
            height: 4,
          ),
          Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
