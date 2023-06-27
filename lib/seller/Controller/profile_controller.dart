import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController{
  //late QueryDocumentSnapshot snapshotData;
  List vendorsdata = [] ;

  var profileImgPath = ''.obs;
  var profileImgLink = '';
  var isloading= false.obs;

  //text field
  var nameController = TextEditingController();
  var oldpassController = TextEditingController();
  var newpassController = TextEditingController();
  //changer l'image //verifier
  changeImage(context) async {
    try {
      final img= await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 20);
      if(img == null) return;
      profileImgPath.value = img.path;
      
    } on PlatformException catch (e) {
      VxToast.show(context , msg: e.toString());
    }

  }
  uploadProfileImage() async{
    var filename = basename(profileImgPath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImgLink = await ref.getDownloadURL();
  }
  updateProfile({email,password,imgUrl})async{
    var store = firestore.collection(vendorsCollection).doc(currentUser!.uid);
    await store.set(
      {
      'password':password , 
      'imageUrl':imgUrl
    });
    isloading(false);
  }
  changeAuthPassword({email,password,newpassword})async{
    final cred = EmailAuthProvider.credential(email:email,password:password);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newpassword);
    }).catchError((error){});
  }

}