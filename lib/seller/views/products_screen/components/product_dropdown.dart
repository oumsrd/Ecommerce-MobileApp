import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/Controller/product_controller.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';


Widget productDropDown(hint, List<String> List,dropvalue , ProductsController controller){
  return Obx( () =>DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: normalText(text: "$hint", color: fontGrey),
        value: dropvalue.value == '' ? null : dropvalue.value,
        isExpanded: true,
        items:  List.map( (e){
          return DropdownMenuItem(
          value: e,
          child: e.toString().text.make(),
          );
        }).toList() , 
        onChanged:(newValue) {
          if(hint == "Category"){
            controller.subcategoryvalue.value = '';
            controller.populateSubcategory(newValue.toString());
          }
          dropvalue.value = newValue.toString();
        } ,
      )
    ).box.color(whiteColor).padding(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.make(),
  );
}