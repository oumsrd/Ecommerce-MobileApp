
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_flutter/seller/Consts/const.dart';
//import 'package:test_flutter/seller/Consts/firebase_consts.dart';
import 'package:velocity_x/velocity_x.dart';


class AuthController extends GetxController{
  var isloading = false.obs;

  //textController
  var emailController= TextEditingController();
  var passwordController = TextEditingController();

  //login method

  Future<UserCredential?> loginMethod({context}) async {
    // isloading.value =false;
    UserCredential? userCredential ;

    try {
      userCredential = await  auth.signInWithEmailAndPassword(email: emailController.text , password: passwordController.text);
        
    } on FirebaseAuthException catch (e){
      VxToast.show(context , msg:e.toString());
    }
    return userCredential;
  }
  //signout Method
  signoutMethod({context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }

  }

    
}