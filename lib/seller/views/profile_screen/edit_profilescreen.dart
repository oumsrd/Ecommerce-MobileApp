import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/Controller/auth_controller.dart';
import 'package:test_flutter/seller/Controller/profile_controller.dart';
import 'package:test_flutter/seller/widgets/custom_textField.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';


class EditProfileScreen extends StatefulWidget {
  //final String? username; 
  const EditProfileScreen({super.key});
  

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
      //profile Controler
    var controller = Get.find<ProfileController>();
    var oldpassword = TextEditingController();
    var newpassword = TextEditingController();

    var auth = FirebaseAuth.instance;
    var currentUser = FirebaseAuth.instance.currentUser;

    changeAuthPassword({email, oldpassword, newpassword}) async {
      if (email != null && email.isNotEmpty && oldpassword != null && oldpassword.isNotEmpty && newpassword != null && newpassword.isNotEmpty) {
        var cred = EmailAuthProvider.credential(email: email, password: oldpassword);
        await currentUser!.reauthenticateWithCredential(cred).then((value) {
          currentUser!.updatePassword(newpassword);
        }).catchError((error) {
          print(error.toString());
        });
      } else {
        print("Invalid input: email, old password, or new password is empty");
        print("password:" +newpassword);
        print("password:" +email);
        print(currentUser);
      }
    }

   /* initState(){
      controller.nameController.text = widget.username!;
      super.initState();

      /*if (widget.username != null && widget.username!.isNotEmpty) {
        controller.nameController.text = widget.username!;
      }*/
      
    }*//*
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
    }*/
  @override
  Widget build(BuildContext context) {
    
    return Obx
    (()=>Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: boldText(text: editProfile ,color: whiteColor,size: 16.0),
          actions: [
            TextButton(onPressed: ()async {
              print("changer your password now :");
              await changeAuthPassword(
                email:"ikramjouichi@gmail.com" ,
                oldpassword: oldpassword.text ,
                newpassword: newpassword.text ,
              );
              print("password changeed");
              /*controller.updateProfile(
                email:"ikramjouichi@gmail.com" ,
                password: newpassword.text,
                imgUrl: controller.profileImgLink,
              );*/
            }, 
            child:normalText(text: save) )
          ],
        ),
        body: Obx(
          () => Column(
            children: [
              //if data controller & image are empty
              //controller.snapshotData['imageUrl']== '' && 
              controller.profileImgPath.isEmpty ?
                 Image.asset(filleProfile,width: 150,).box.roundedFull.clip(Clip.antiAlias).make()
                 //if data image & controller not empty 
                  //:controller.snapshotData['imageUrl'] != '' && controller.profileImgPath.isEmpty ?
                   /*Image.network(
                    controller.snapshotData['imageUrl'],
                    width: 100, 
                    fit:BoxFit.cover ,
                   ).box.roundedFull.clip(Clip.antiAlias).make()*/
                   //else if controller path is not empty but data url is
                   :Image.file(
                      File(controller.profileImgPath.value),
                      width: 100,
                      fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: whiteColor),
                onPressed: () {
                  controller.changeImage(context);
                  //controller.uploadProfileImage();
                }, 
                child: normalText(text: changeImage,color: darkFontGrey),
              ),
              10.heightBox,   
              //customTextField(label: name , hint:nameHint,controller: controller.nameController),
              10.heightBox,
              customTextField(label: password, hint: passwordHint,controller: oldpassword),
              10.heightBox,
              customTextField(label: confirmPassword,hint: passwordHint ,controller:newpassword),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}