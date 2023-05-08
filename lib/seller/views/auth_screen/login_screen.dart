import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/Controller/auth_controller.dart';
import 'package:test_flutter/seller/views/home_screen/home.dart';
import 'package:test_flutter/seller/widgets/loading_indicator.dart';
import 'package:test_flutter/seller/widgets/our_button.dart';
import 'package:velocity_x/velocity_x.dart';


import '../../widgets/normal_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              normalText(text:welcome,color:Colors.white,size: 20.0),
              40.heightBox,
              normalText(text:loginTo,color: lightGrey,size: 16.0),

              Obx(()=>Column(
                  children: [
                    TextFormField(
                      controller:  controller.emailController,
                      decoration:const  InputDecoration(
                        filled: true,
                        fillColor: textfeildGrey,
                        prefixIcon: Icon(Icons.email,color: purpleColor,),
                        border: InputBorder.none,
                        hintText: emailHint,
                      ),
                    ),
                    10.heightBox,
                    TextFormField(
                      obscureText: true,
                      controller:  controller.passwordController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: textfeildGrey,
                        prefixIcon: Icon(Icons.lock,color: purpleColor,),
                        border: InputBorder.none,
                        hintText: passwordHint,
                      ),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: () {}, child: normalText(text: forgetPassword,color: purpleColor))),
                    30.heightBox,
                    SizedBox(
                      width: context.screenWidth - 100,
                      child: controller.isloading.value ? loadingIndicator() :  ourButton(
                        title: login,
                        onPress: () async{
                          //Get.to(() => const Home());
                          controller.isloading(true);
                            await controller.loginMethod(context: context).then((value) {
                              if(value !=null) {
                                VxToast.show(context, msg: "logged in");
                                controller.isloading(false);
                                Get.offAll(() => const Home());
                              } else {
                                controller.isloading(false);
                              }
                            });
              
                        },
                    
                      ),
                    ),
                  ],
                ).box.color(Colors.white).border(color: whiteColor).rounded.outerShadowMd.padding(const EdgeInsets.all(8)).make(),
              ),
              10.heightBox,
              Center(child: normalText(text:anyProblem,color: lightGrey),),
              const Spacer(),
              Center(child: normalText(text:credit),),
              20.heightBox,
            ],
            )//.box.border(color:purpleColor).rounded.padding(const EdgeInsets.all(8)).make(),
        ),
      ),
    );
  }
}