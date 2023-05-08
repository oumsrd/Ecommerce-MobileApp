import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';

Widget orderPlaceDetails({title1,title2,d1,d2}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: "$title1",color: fontGrey),
            boldText(text: "$d1",color: red),
            //"$title1".text.fontFamily(semibold).make(),
            //"$d1".text.color(red).fontFamily(semibold).make()
          ],
        ),
        SizedBox(
          width: 130,
          child: Column(
            children: [
              boldText(text: "$title2",color:purpleColor ),
              boldText(text: "$d2",color: fontGrey),
              //"$title2".text.fontFamily(semibold).make(),
              //"$d2".text.make()
            ]
          ),
        ),
      ],
    ),
  );
}