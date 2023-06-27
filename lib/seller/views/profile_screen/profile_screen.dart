import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/Controller/auth_controller.dart';
import 'package:test_flutter/seller/Controller/profile_controller.dart';
import 'package:test_flutter/seller/services/store_services.dart';
import 'package:test_flutter/seller/views/auth_screen/login_screen.dart';
import 'package:test_flutter/seller/views/messages_screen/messages_screen.dart';
import 'package:test_flutter/seller/views/profile_screen/edit_profilescreen.dart';
import 'package:test_flutter/seller/views/shop_settings/shop_settings_screen.dart';
import 'package:test_flutter/seller/widgets/loading_indicator.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl ;
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //final currentUser = FirebaseAuth.instance;

  List vendorsdata = [] ;
  CollectionReference vendorref = FirebaseFirestore.instance.collection("vendors");
  getData () async {
    var responsprofile = await  vendorref.get();
    responsprofile.docs.forEach((element) {
      setState(() {
        vendorsdata.add(element.data());
      });
     });
  }
  @override
  void initState(){
    getData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var controller =  Get.put(ProfileController());
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: boldText(text: settings ,color: whiteColor,size: 16.0),
        actions: [
          IconButton(onPressed: (){
            Get.to(() =>EditProfileScreen());
          }, icon: Icon(Icons.edit)),
          TextButton(onPressed: ()async {
            await Get.find<AuthController>().signoutMethod(context);
            Get.offAll(() => const LoginScreen());
            }, child:normalText(text: logout) )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(filleProfile).box.roundedFull.clip(Clip.antiAlias).make(),
              title: vendorsdata.isNotEmpty ? boldText(text: "${vendorsdata[0]['vendor-name']}") : SizedBox(),
              //subtitle: vendorsdata.isNotEmpty ? normalText(text: "${vendorsdata[2]['email']}") : SizedBox(),
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