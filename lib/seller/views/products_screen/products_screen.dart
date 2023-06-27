import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:intl/intl.dart' as intl ;
import 'package:test_flutter/seller/Controller/product_controller.dart';
import 'package:test_flutter/seller/views/products_screen/add_product.dart';
import 'package:test_flutter/seller/views/products_screen/product_details.dart';
import 'package:test_flutter/seller/widgets/loading_indicator.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import '../../services/store_services.dart';
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductsController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: ()async {
          await controller.getCategories();
          controller.pupulateCategoryList();
          Get.to( ()=>const AddProduct() );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: boldText(text: products ,color: darkFontGrey,size: 16.0),
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
            print("voici mon data");
            print(data.length);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children:List.generate(
                      data.length,
                      (index) =>Card(
                        child: ListTile(
                          onTap: () {
                            Get.to( () => ProductDetails(
                              data:data[index]
                            ));
                          },
                          leading: Image.network(data[index]['p_imgs'][0],width: 100,height: 100,fit: BoxFit.cover),
                          title: boldText(text: "${data[index]['p_name']}", color: darkFontGrey ),
                          
                          subtitle: Row(
                            children: [
                              normalText(text: "\$${data[index]['p_price']}", color: fontGrey),
                              10.widthBox,//data[index]['isfeatured'] == true   ?  "Featured" : ''
                              boldText(text: data[index]['isfeatured'] == true   ?  "Featured" : '', color:green),
                            ],
                          ),
                          trailing: VxPopupMenu(
                            arrowSize: 0.0,
                            menuBuilder: () => Column(
                                children: List.generate(
                                  popupMenuTitles.length, 
                                  (i) =>Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          popupMenuIcons[i],
                                          color: data[index]['featured_id'] == currentUser!.uid && i==0 
                                          ? green 
                                          : fontGrey
                                          ),
                                        10.widthBox,
                                        normalText(
                                          text: data[index]['featured_id'] == currentUser!.uid && i==0
                                          ? 'Remove feature'
                                          :popupMenuTitles[i],
                                          color: fontGrey),
                                      ],
                                    ).onTap(() { 
                                      switch (i) {
                                        case 0:
                                          if(data[index]['isfeatured'] == true){
                                            controller.removeFeatured(data[index].id);
                                            VxToast.show(context, msg: "Removed");
                                          }else{
                                            controller.addFeatured(data[index].id);
                                            VxToast.show(context, msg: "Added");
                                          }
                                          break;
                                          case 1 :
                                          break;
                                          case 2:
                                          controller.removeProduct(data[index].id);
                                          VxToast.show(context, msg: "Product Removed");
                                          break;
                                        default:
                                      }
                                    }),
                                  ),
                                ),
                              ).box.white.rounded.width(200).width(200).make(), 
                            clickType: VxClickType.singleClick,
                            child:const Icon(Icons.more_vert_rounded)),
                        ),
                      ),
                    ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}