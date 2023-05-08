import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:intl/intl.dart' as intl ;
import 'package:test_flutter/seller/views/products_screen/add_product.dart';
import 'package:test_flutter/seller/views/products_screen/product_details.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {
          Get.to( ()=> AddProduct() );
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children:List.generate(
                20, 
                (index) =>Card(
                  child: ListTile(
                    onTap: () {
                      Get.to( () => ProductDetails());
                    },
                    leading: Image.asset(watch,width: 100,height: 100,fit: BoxFit.cover),
                    title: boldText(text: "Product title", color: darkFontGrey ),
                    subtitle: Row(
                      children: [
                        normalText(text: "\$40.0", color: fontGrey),
                        10.widthBox,
                        boldText(text: "Featured", color:green),
                      ],
                    ),
                    trailing: VxPopupMenu(
                      arrowSize: 0.0,
                      menuBuilder: () => Column(
                          children: List.generate(
                            popupMenuTitles.length, 
                            (index) =>Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Icon(popupMenuIcons[index]),
                                  10.widthBox,
                                  normalText(text: popupMenuTitles[index],color: fontGrey),
                                ],
                              ).onTap(() { }),
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
      )
    );
  }
}