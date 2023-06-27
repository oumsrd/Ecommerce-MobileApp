import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Controller/HomeContoller.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:get/get.dart';
import 'package:test_flutter/seller/views/home_screen/home_screen.dart';
import 'package:test_flutter/seller/views/orders_screen/orders_screen.dart';
import 'package:test_flutter/seller/views/products_screen/products_screen.dart';
import 'package:test_flutter/seller/views/profile_screen/profile_screen.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeContoller());

    var navScreens = [
      const HomeScreen(),const ProductsScreen(),const OrdersScreen(), ProfileScreen()];

    var bottomNavbar = [
      const BottomNavigationBarItem(
        icon:Icon(Icons.home), 
        label:dashboard
        ),
      const BottomNavigationBarItem(
        icon:Icon(Icons.dashboard), 
        label:products,
        ),
      const BottomNavigationBarItem(
        icon:Icon(Icons.article), 
        label:orders,
        ),
      const BottomNavigationBarItem(
        icon:Icon(Icons.settings), 
        label:settings,
        ),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(
        
        () =>  BottomNavigationBar(
          onTap: (index) {
            controller.navIndex.value = index ;
          },
          currentIndex: controller.navIndex.value,
          type: BottomNavigationBarType.fixed,
          items: bottomNavbar,
          selectedItemColor : red ,
          unselectedItemColor: whiteColor,
          ),
      ),
      
      body: Obx
      (
        () => Column(
          children: [
            Expanded(
              child: navScreens.elementAt(controller.navIndex.value),),
          ],
        ),
      ),
    );
  }
}