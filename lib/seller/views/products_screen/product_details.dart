import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/views/messages_screen/chat_screen.dart';
import 'package:test_flutter/seller/views/orders_screen/components/order_place.dart';
import 'package:test_flutter/seller/widgets/custom_textField.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:test_flutter/seller/widgets/our_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl ;


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          icon: Icon(Icons.arrow_back,color: fontGrey),
          onPressed: () {
            Get.back();
          },
        ),
        title: boldText(text:"Product title",size: 16.0,color: fontGrey),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
              autoPlay: true,
              height: 350,
              itemCount:3,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0, 
              itemBuilder: (context, index){
                return Image.asset(
                  sac,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  boldText(text: "Product Title", color: darkFontGrey),
                  10.heightBox,
                  Row(
                    children: [
                      boldText(text: "Category", color: fontGrey,size: 16.0),
                      10.widthBox,
                      normalText(text: "Subcategory", color: fontGrey,size: 16.0),
                    ],
                  ),
                  10.heightBox,
                  VxRating(
                    isSelectable: false,
                    value:3.0,
                    onRatingUpdate: (value){},
                    normalColor: textfeildGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25, 
                  ),
                  10.heightBox,
                  boldText(text: "\$300.0" , color: red, size:  18.0),
                  10.heightBox,
                  Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: boldText(text: "Color", color: fontGrey),
                            ),
                            Row(
                              children: List.generate(
                                3, 
                                (index) => VxBox().size(40, 40).roundedFull.color(Vx.randomPrimaryColor).margin(const EdgeInsets.symmetric(horizontal: 4)).make().onTap(() { }),
                              ),
                            ),
                          ],
                        ),
                        10.heightBox,
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: boldText(text: "Quantity", color: fontGrey),
                            ),
                            normalText(text: "20 items", color: fontGrey),
                          ],
                        ),//.box.padding(const EdgeInsets.all(8)).make(),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).white.shadowSm.make(),
                    const Divider(),
                    20.heightBox,
                    boldText(text: "Description", color: fontGrey),
                    10.heightBox,
                    boldText(text: "Description of this item", color: fontGrey),

                ],
              ),
            ),
            
          ],
        ),),
    );
  }
}