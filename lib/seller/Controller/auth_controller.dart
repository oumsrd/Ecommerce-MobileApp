
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
//import 'package:test_flutter/client/views/home_screen/home_screen.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/views/auth_screen/login_screen.dart';
import 'package:test_flutter/seller/views/home_screen/home.dart';
import 'package:test_flutter/seller/views/profile_screen/test.dart';
//import 'package:test_flutter/seller/Consts/firebase_consts.dart';
import 'package:velocity_x/velocity_x.dart';


class AuthController extends GetxController{
  var isloading = false.obs;

  //textController
  var emailController= TextEditingController();
  var passwordController = TextEditingController();

  //login method
  Future<UserCredential?> loginMethod({context}) async {
  UserCredential? userCredential;

  try {
    userCredential = await auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    if (userCredential != null) {
      // Retrieve the user document from Firestore
      DocumentSnapshot userDoc = await firestore
          .collection('vendors')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists) {
        // Check if the email is in the list of admin emails
        List<String> adminEmails = ['ikramjouichi@gmail.com', 'admin2@example.com'];
        String userEmail = userDoc['email'];

        if (adminEmails.contains(userEmail)) {
          // Redirect to the admin screen
           Get.offAll(() =>Home());
        } else {
          // Redirect to the user screen
           Get.offAll(() =>LoginScreen());
        }
      }
    }
  } on FirebaseAuthException catch (e) {
    VxToast.show(context, msg: e.toString());
  }

  return userCredential;
}


 /* Future<UserCredential?> loginMethod({context}) async {
    // isloading.value =false;
    UserCredential? userCredential ;

    try {
       // Accéder à la collection 'vendors'
      CollectionReference vendorsRef = firestore.collection('vendors');
      userCredential = await  auth.signInWithEmailAndPassword(email: emailController.text , password: passwordController.text);
    } on FirebaseAuthException catch (e){
      VxToast.show(context , msg:e.toString());
    }
    return userCredential;
  }*/
  //signout Method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }

  }

    
}