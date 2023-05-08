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


class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

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
        title: boldText(text:"Order details",size: 16.0,color: fontGrey),
      ),
      bottomNavigationBar: SizedBox(
        child:ourButton(color: green,onPress: (){},title: "Confirm Order") 
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //order delivery status section
              Visibility(
                visible: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(text: "Order Status",color:purpleColor ),
                    SwitchListTile(
                      activeColor: green,
                      value: true, 
                      onChanged: (value){},
                      title: boldText(text: "Placed",color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: true, 
                      onChanged: (value){},
                      title: boldText(text: "Confirmed",color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: true, 
                      onChanged: (value){},
                      title: boldText(text: "on Delivery",color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: true, 
                      onChanged: (value){},
                      title: boldText(text: "Delivereded",color: fontGrey),
                    )  
                  ],
                ).box.padding(const EdgeInsets.all(8)).outerShadowMd.white.border(color: lightGrey).roundedSM.make(),
              ),




              //order details section
              Column(
                children: [
                  orderPlaceDetails(
                    d1: "data['order_code']",
                    d2: "data['shipping_method']",
                    title1: "order Code",
                    title2:"shipping Method",
                  ),
                  orderPlaceDetails(
                    d1: DateTime.now(),
                    //d1: intl.DateFormat().add_yMd().format((data['order_code'].toDate)),
                    d2: "data['payment_method']",
                    title1: "order Date",
                    title2:"Payment Method",
                  ),
                  orderPlaceDetails(
                    d1: "Unpaid",
                    d2: "Order Placed",
                    title1: "Payment Status",
                    title2:"Delivery Status",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //"Shipping Adress".text.fontFamily(semibold).make(),
                            boldText(text: "Shipping Adress",color: purpleColor),
                            "{data['order_by_name']}".text.make(),
                            "{data['order_by_email']}".text.make(),
                            "{data['order_by_address']}".text.make(),
                            "{data['order_by_city']}".text.make(),
                            "{data['order_by_state']}".text.make(),
                            "{data['order_by_phone']}".text.make(),
                            "{data['order_by_posyalcode']}".text.make(),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(text: "Total Amount",color: purpleColor),
                              boldText(text: "\$300.0",color: red, size: 16.0),
                              //"Total Amount".text.fontFamily(semibold).make(),
                              //"{data['total_amount']}".text.color(red).fontFamily(bold).make(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ).box.outerShadowMd.white.border(color: lightGrey).roundedSM.make(),
              const Divider(),
              10.heightBox,
              boldText(text: "Ordered Products ",color: fontGrey ,size: 16.0),
              10.heightBox,
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children:List.generate(3, (index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderPlaceDetails(
                        d1: "data['orders][index]['title']",
                        d2: "data['orders][index]['tprice']",
                        title1: "{data['order][index]['qtt']}x",
                        title2:"Refundable",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 30,
                          height: 20,
                          color: purpleColor,
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                }).toList(),
              ).box.outerShadowMd.white.margin(const EdgeInsets.only(bottom: 4)).make(),
              20.heightBox,
            ],
          ),
        ),
      ) ,
    );
  }
}