import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/client/screens/auth_ui/welcome/welcome.dart';
import 'package:test_flutter/seller/views/auth_screen/login_screen.dart';
import 'package:test_flutter/seller/widgets/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

class ChooseUser extends StatelessWidget {
  const ChooseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          SizedBox(
            width: context.screenWidth - 100,
            child: ourButton(
              title: "I am a Seller",
              onPress: () async{
                Get.to(() => const LoginScreen());
              },
            ),
          ),
          SizedBox(
            width: context.screenWidth - 100,
            child: ourButton(
              title: "I am a Client",
              onPress: () async{
                Get.to(() => const Welcome());
              },
            ),
          ),
        ],
      ),
    );
  }
}