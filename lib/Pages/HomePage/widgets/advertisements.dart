import 'package:flutter/cupertino.dart';

Widget advertisements() {
  return Container(
    height: 160,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (int i = 1; i < 4; i++)
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Image.asset(
                'assets/deals/deal$i.png',
                height: 130,
                width: 250,
                fit: BoxFit.cover,

          )
          ),
      ],
    ),
  );
}