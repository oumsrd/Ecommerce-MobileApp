import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Consts/const.dart';
import '../../Controller/HomeContoller.dart';
import '../cart_screen/cart_screen.dart';
import '../category_screen/category_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'home_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //init HomeController
    var controller = Get.put(HomeContoller());
    var navbarItem = const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
    ];
    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen()
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: Colors.red,
          //selectedLabelStyle: const TextStyle(),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          items: navbarItem,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
