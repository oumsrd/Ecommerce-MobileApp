import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/widgets/custom_textField.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: boldText(text: editProfile ,color: whiteColor,size: 16.0),
        actions: [
          TextButton(onPressed: (){}, child:normalText(text: save) )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(filleProfile,width: 150,).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: whiteColor),
              onPressed: () {}, 
              child: normalText(text: changeImage,color: darkFontGrey),
            ),
            10.heightBox,
            const Divider(color: whiteColor,),
            10.heightBox,
            customTextField(label: name , hint:nameHint),
            10.heightBox,
            customTextField(label: password, hint: passwordHint),
            10.heightBox,
            customTextField(label: confirmPassword,hint: passwordHint),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}