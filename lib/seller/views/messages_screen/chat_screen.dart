import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/views/messages_screen/messages_screen.dart';
import 'package:test_flutter/seller/widgets/custom_textField.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
        title: boldText(text: chats ,size: 16.0,color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(color: Colors.green,),
            ),
            10.heightBox,
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "entrer message",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: purpleColor),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: purpleColor)
                      ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.send, color:purpleColor))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}