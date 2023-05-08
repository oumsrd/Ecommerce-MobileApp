import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:get/get.dart';
import 'package:test_flutter/seller/views/orders_screen/order_details.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl;


class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: boldText(text: orders ,color: darkFontGrey,size: 16.0),
        actions: [
          Center(child: normalText(text: intl.DateFormat('EEE, MMM d , ''yy').format(DateTime.now()),color: purpleColor)),
          10.widthBox,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children:  List.generate(
                  24, 
                  (index) =>ListTile(
                    onTap: () {
                      Get.to(() => const OrderDetails());
                    },
                    tileColor: textfeildGrey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    title: boldText(text: "901237849012873", color: purpleColor ),
                    subtitle: Column(
                      children : [ 
                        Row(
                          children: [
                            const Icon(Icons.calendar_month,color: darkFontGrey),
                            10.widthBox,
                            boldText(text: intl.DateFormat().add_yM().format(DateTime.now()),color: darkFontGrey),
                            
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.payment,color: darkFontGrey),
                            10.widthBox,
                            boldText(text: unpaid,color: red),
                            
                          ],
                        )
                      ],

                    ),
                    trailing: boldText(text: "\$40.0",color: purpleColor, size: 16.0),
                  ).box.margin(const EdgeInsets.only(bottom: 4)).make(),
                  ),
          ),
        ),
      ),
    );
  }
}