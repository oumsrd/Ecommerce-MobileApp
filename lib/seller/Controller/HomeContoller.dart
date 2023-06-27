import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/seller/Consts/const.dart';

class HomeContoller extends GetxController {
  var username = "";
  List vendorsdata = [] ;
  CollectionReference vendorref = FirebaseFirestore.instance.collection("vendors");
  getUsername () async {
    var responsprofile = await  vendorref.get();
    responsprofile.docs.forEach((element) {
      
        vendorsdata.add(element.data());
        username = vendorsdata[0]['vendor-name'];
        print(username);
     });
  }

  void onInit(){
    
    getUsername();
    super.onInit();
  }
  var navIndex = 0.obs;
  


  /*getUsername()async{
    var n =await firestore.collection('vendors').where('id', isEqualTo: currentUser!.uid).get().then((value) {
       if(value.docs.isNotEmpty){
        return value.docs.single['vendor-name'];
       }
    });
      if(username.isEmpty){
        print("username est null");
      }else{
      username = n;
      print(username);
      }
  }*/
}
