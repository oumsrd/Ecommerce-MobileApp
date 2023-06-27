import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:get/get.dart';
import 'package:test_flutter/seller/Controller/orders_controller.dart';
import 'package:test_flutter/seller/views/orders_screen/order_details.dart';
import 'package:test_flutter/seller/widgets/loading_indicator.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl;


class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(OrdersController() );


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: boldText(text: orders ,color: darkFontGrey,size: 16.0),
        actions: [
          Center(child: normalText(text: intl.DateFormat('EEE, MMM d , ''yy').format(DateTime.now()),color: purpleColor)),
          10.widthBox,
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return loadingIndicator();
          }else{

            var data = snapshot.data!.docs;
            print("voici mon data");
            print(data.length);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children:  List.generate(
                        data.length, 
                        (index) {
                          var time = data[index]['order_date'].toDate();
                          return ListTile(
                            onTap: () {
                              Get.to(() => OrderDetails(data: data[index]));
                            },
                            tileColor: textfeildGrey,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            title: boldText(text: "${data[index]['order_code']}", color: purpleColor ),
                            subtitle: Column(
                              children : [ 
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_month,color: darkFontGrey),
                                    10.widthBox,
                                    boldText(text: intl.DateFormat().add_yMd().format(time),color: darkFontGrey),
                                    
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
                            trailing: boldText(text: "\$ ${data[index]['total_amount']}",color: purpleColor, size: 16.0),
                          ).box.margin(const EdgeInsets.only(bottom: 4)).make();
                        }
                        ),
                ),
              ),
            );
          }
        }
       
      )
   );
  }
}