import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:intl/intl.dart' as intl ;
import 'package:test_flutter/seller/views/products_screen/add_product.dart';
import 'package:test_flutter/seller/views/products_screen/components/product_dropdown.dart';
import 'package:test_flutter/seller/views/products_screen/components/product_images.dart';
import 'package:test_flutter/seller/views/products_screen/product_details.dart';
import 'package:test_flutter/seller/widgets/custom_textField.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading:IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: true,
        title: boldText(text: "Add Product" ,size: 16.0),
        actions: [
          Center(child: normalText(text: intl.DateFormat('EEE, MMM d , ''yy').format(DateTime.now()),color: whiteColor)),
          10.widthBox,
          TextButton(onPressed: (){}, child:boldText(text: save ,color:whiteColor ,size: 16.0),  )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(hint:"ex: Watch" ,label: "Product name" ),
              10.heightBox,
              customTextField(hint:"ex: description " ,label: "Description", isDesc: true ),
              10.heightBox,
              customTextField(hint:"ex: \$100" ,label: "Price" ),
              10.heightBox,
              customTextField(hint:"ex: \$150" ,label: "Price" ),
              10.heightBox,
              customTextField(hint:"ex: 20 " ,label: "Quantity" ),
              20.heightBox,
              productDropDown(),
              10.heightBox,
              productDropDown(),
              10.heightBox,
              const Divider(color: whiteColor),
              boldText(text: "Choose product images" ,size: 16.0),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3, 
                  (index) => productImages(label: "${index + 1}"), 
                ) ,
              ),
              5.heightBox,
              normalText(text: "First image will be your display image" ,size: 12.0,color: lightGrey),
              const Divider(color: whiteColor),
              10.heightBox,
              boldText(text: "Choose product colors" ,size: 16.0),
              10.heightBox,
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  9, 
                  (index) => Stack(
                    alignment: Alignment.center,
                    children:[
                      VxBox().color(Vx.randomPrimaryColor).roundedFull.size(70, 70).make(),
                      const Icon(Icons.done , color: whiteColor,)
                    ] ,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}