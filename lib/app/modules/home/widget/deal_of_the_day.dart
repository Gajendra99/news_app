import 'package:flutter/material.dart';

class DealOfTheDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deal of the day',
            style: TextStyle(fontSize: 9 * 2, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9 * 2),
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.grey.withOpacity(1 / 2), // Set the shadow color
                    spreadRadius: 1, // Set the spread radius of the shadow
                    blurRadius: 5, // Set the blur radius of the shadow
                    offset: Offset(0, 2), // Set the offset of the shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          "https://static-00.iconduck.com/assets.00/samsung-icon-2048x2048-1ej4ectz.png",
                          width: 9 * 3 + 3,
                          height: 9 * 3 + 3,
                        ),
                        Text(
                          'Save 40% on Samsung Galaxy Note 9',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                            onPressed: null, icon: Icon(Icons.favorite_outline))
                      ],
                    ),
                    Image.network(
                        "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2023/5/23/b52252a8-8e37-4bb5-a99f-b23a15c8455e.jpg"),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
