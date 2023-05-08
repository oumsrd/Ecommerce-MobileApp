import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';


Widget productDropDown(){
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      hint: normalText(text: "Choose category", color: fontGrey),
      value: null,
      isExpanded: true,
      items: const [], 
      onChanged:(value) {} ,
    )
  ).box.color(whiteColor).padding(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.make();
}