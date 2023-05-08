import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/views/messages_screen/messages_screen.dart';
import 'package:test_flutter/seller/views/profile_screen/edit_profilescreen.dart';
import 'package:test_flutter/seller/views/shop_settings/shop_settings_screen.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl ;
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: boldText(text: settings ,color: whiteColor,size: 16.0),
        actions: [
          IconButton(onPressed: (){
            Get.to(() => const EditProfileScreen());
          }, icon: Icon(Icons.edit)),
          TextButton(onPressed: (){}, child:normalText(text: logout) )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(filleProfile).box.roundedFull.clip(Clip.antiAlias).make() ,
              title: boldText(text: "vendor name"),
              subtitle: normalText(text: "vendoremail@gmail.com"),
            ),
            const Divider(),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(
                  profileButtonsIcons.length, 
                  (index) => ListTile(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Get.to(() => const ShopSettings());
                          break;
                        case 1:
                          Get.to(() => const MessagesScreen());
                          break;
                        default:
                      }
                    },
                    leading: Icon(profileButtonsIcons[index],color: whiteColor,),
                    title: normalText(text: profileButtonsTitles[index]),
                  )),
              ),
            )
          ],
        ),
      ) ,
    );
  }
}