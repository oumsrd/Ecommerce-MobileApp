import 'package:test_flutter/client/Consts/const.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Expanded(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      icon,
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  )).box.rounded.white.size(width, height).shadowSm.make();
}
