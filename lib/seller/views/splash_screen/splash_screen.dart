/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:s/consts/consts.dart';
import 'package:get/get.dart';

import '../../widgets_common/applogo_widget.dart';
import '../auth_screen/login_screen.dart';
import '../pages/home.dart';*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/client/screens/auth_ui/welcome/welcome.dart';
import 'package:test_flutter/client/screens/home/home.dart';
import 'package:test_flutter/seller/views/auth_screen/login_screen.dart';
import 'package:test_flutter/seller/views/splash_screen/chooseUser.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Consts/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating a method to change screen
  /*ChangeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      //using getX
      //Get.to(() => const ChooseUser());
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const LoginScreen());
        } else {
          Get.to(() => const Home());
        }
      }
      );
    }
    );
  }*/
  ChangeScreen() {
  //using getX
  //Get.to(() => const ChooseUser());
  auth.authStateChanges().listen((User? user) {
    Get.to(() => const ChooseUser());
    /*if (user == null && mounted) {
      Get.to(() => const ChooseUser());
    } else {
      // Vérifier si l'utilisateur a le rôle de vendeur
      FirebaseFirestore.instance
          .collection('vendors')
          .where('email', isEqualTo: user!.email)
          .get()
          .then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          // L'utilisateur est un vendeur
          Get.to(() => const Home());
        } else {
          // L'utilisateur est un utilisateur normal
          Get.to(() => const ChooseUser());
        }
      }).catchError((error) {
        // Gérer les erreurs
        print('Erreur lors de la récupération des informations du vendeur: $error');
        // Rediriger vers une page d'erreur ou faire autre chose
      });
    }*/
  });
}


  @override
  void initState() {
    ChangeScreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //0077B5
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 119, 191),
      body: Center(
        child: Column(
          children: [
            // Align(alignment: ,),
            300.heightBox,
            Image.asset(welcomImg),
            10.heightBox,
            "Shop Express".text.color(whiteColor).fontFamily(bold).size(22).make(),
            5.heightBox,
           
            30.heightBox
          ],
        ),
      ),
    );
  }
}
