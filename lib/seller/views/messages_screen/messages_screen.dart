import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/views/messages_screen/chat_screen.dart';
import 'package:test_flutter/seller/widgets/custom_textField.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          icon: Icon(Icons.arrow_back,color: fontGrey),
          onPressed: () {
            Get.back();
          },
        ),
        title: boldText(text:messages,size: 16.0,color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              20, 
              (index) => ListTile(
                    onTap:() {
                      Get.to(() => const ChatScreen() );
                    } ,
                    leading:const  CircleAvatar(
                      backgroundColor: purpleColor,
                      child: Icon(
                        Icons.person, 
                        color: whiteColor, 
                      ),
                    ),
                    title: boldText(text: "username",color: fontGrey),
                    subtitle: normalText(text: "last message ...",color: darkFontGrey),
                    trailing: normalText(text: "10:45PM",color: darkFontGrey),
               ),
            ),
          ),
        ),
      ),
    );
  }
}