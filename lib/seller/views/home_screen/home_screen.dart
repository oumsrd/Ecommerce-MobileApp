import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/views/products_screen/product_details.dart';
import 'package:test_flutter/seller/widgets/dashboard_button.dart';
import 'package:test_flutter/seller/widgets/loading_indicator.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/velocity_x.dart';

import '../../services/store_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: dashboard ,color: darkFontGrey,size: 16.0),
        actions: [
          Center(child: normalText(text: intl.DateFormat('EEE, MMM d , ''yy').format(DateTime.now()),color: purpleColor)),
          10.widthBox,
       
        ],
      
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return loadingIndicator();
          }else{

            var data = snapshot.data!.docs;
            data.sortedBy((a, b) => b['p_wishlist'].length.compareTo(a['p_wishlist'].length) );
          
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context, title:products,count:"${data.length}",icon: Icons.dashboard),
                      dashboardButton(context, title:orders,count:"15" ,icon: Icons.article),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context, title:rating,count:"75" ,icon: Icons.star),
                      dashboardButton(context, title:totalSales,count:"15",icon: Icons.article_rounded),
                    ],
                  ),
                  10.heightBox,
                  const Divider(),
                  10.heightBox,
                  boldText(text: popular,color: darkFontGrey , size: 16.0), 
                  20.heightBox,
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      data.length, 
                      (index) => data[index]['p_wishlist'].length == 0 
                      ? const SizedBox()
                      : ListTile(
                        onTap: () {
                          Get.to(()=> ProductDetails(data: data[index],) );
                        },
                        leading: Image.network(data[index]['p_imgs'][0],width: 100,height: 100,fit: BoxFit.cover),
                        title: boldText(text: "${data[index]['p_name']}", color: darkFontGrey ),
                        subtitle: normalText(text: "\$${data[index]['p_price']}", color: fontGrey),
                      )
                      ),
                  )

                ],
                ),
                 
              );
          }}
      )
    );
  }
}