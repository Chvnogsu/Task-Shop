import 'package:flutter/material.dart';

const Color black = Color(0xffFDC054);
const Color black45 = Color(0x73000000);
const Color darkBlack = Color(0xFF000000);
const Color transparent = Color(0x00000000);
const Color darkGrey = Color(0xff202020);

const LinearGradient mainButton = LinearGradient(
  colors: [Colors.black, Colors.black],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6),
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}
