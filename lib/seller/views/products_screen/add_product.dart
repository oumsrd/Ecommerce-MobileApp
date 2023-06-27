import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:intl/intl.dart' as intl ;
import 'package:test_flutter/seller/Controller/product_controller.dart';
import 'package:test_flutter/seller/views/products_screen/add_product.dart';
import 'package:test_flutter/seller/views/products_screen/components/product_dropdown.dart';
import 'package:test_flutter/seller/views/products_screen/components/product_images.dart';
import 'package:test_flutter/seller/views/products_screen/product_details.dart';
import 'package:test_flutter/seller/widgets/custom_textField.dart';
import 'package:test_flutter/seller/widgets/loading_indicator.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();
    return Obx( 
      () =>Scaffold(
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
            controller.isloading.value
            ? loadingIndicator()
            : 
            TextButton(
              onPressed: () async{
                await controller.uploadImage();
                await controller.uploadProduct(context);
                Get.back();
    
              }, 
              child:boldText(text: save ,color:whiteColor ,size: 16.0),  
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
    
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField(hint:"ex: Watch" ,label: "Product name" , controller:  controller.pnameController),
                10.heightBox,
                customTextField(hint:"ex: description " ,label: "Description", isDesc: true , controller:  controller.pdescController ),
                10.heightBox,
                customTextField(hint:"ex: \$100" ,label: "Price" , controller:  controller.ppriceController),
                10.heightBox,
                customTextField(hint:"ex: 20 " ,label: "Quantity" , controller:  controller.pquantityController),
                20.heightBox,
                productDropDown("Category", controller.categoryList, controller.categoryvalue , controller),
                10.heightBox,
                productDropDown("SubCategory", controller.subcategoryList , controller.subcategoryvalue , controller),
                10.heightBox,
                const Divider(color: whiteColor),
                boldText(text: "Choose product images" ,size: 16.0),
                10.heightBox,
                Obx( () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      3, 
                      (index) => controller.pImagesList[index] != null 
                      ? Image.file(controller.pImagesList[index], width: 100,
                      ).onTap(() {
                        controller.pickImage(index, context);
                      }) 
                      : productImages(label: "${index + 1}").onTap(() {
                        controller.pickImage(index, context);
                      }), 
                    ) ,
                  ),
                ),
                5.heightBox,
                normalText(text: "First image will be your display image" ,size: 12.0,color: lightGrey),
                const Divider(color: whiteColor),
                10.heightBox,
                boldText(text: "Choose product colors" ,size: 16.0),
                10.heightBox,
                Obx(() => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(
                      9, 
                      (index) => Stack(
                        alignment: Alignment.center,
                        children:[
                          VxBox().color(Vx.randomPrimaryColor).roundedFull.size(65 , 65).make().onTap(() {
                            controller.selectedColorIndex.value = index ;
                          }),
                          controller.selectedColorIndex.value == index 
                          ? const Icon(Icons.done , color: whiteColor,) 
                          : const SizedBox(),
                        ] ,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}