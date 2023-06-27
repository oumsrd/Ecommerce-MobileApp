import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:test_flutter/seller/Controller/HomeContoller.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/models/category_model.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:velocity_x/velocity_x.dart';


class ProductsController extends GetxController{ 
  var isloading = false.obs; 
  //text field controllers
  var pnameController = TextEditingController();
  var pdescController = TextEditingController();
  var ppriceController = TextEditingController();
  var pquantityController = TextEditingController();

  var categoryList = <String>[].obs;
  var subcategoryList = <String>[].obs;
  List<Category> category = [];
  var pImagesLinks = [];
  var pImagesList = RxList<dynamic>.generate(3, (index) => null );
  var categoryvalue = ''.obs;
  var subcategoryvalue = ''.obs;
  var selectedColorIndex = 0.obs;
  
  getCategories() async{
    var data = await rootBundle.loadString("lib/seller/services/category_model.json");
    var cat = categoryModelFromJson(data);
    category = cat.categories;
  }

  pupulateCategoryList(){
    categoryList.clear();
    for(var item in category){
      categoryList.add(item.name);
    }
  }

  populateSubcategory(cat){
    subcategoryList.clear();

    var data = category.where((element) => element.name == cat).toList();

    for ( var i=0 ; i<data.first.subcategory.length; i++){
      subcategoryList.add(data.first.subcategory[i]);
    }
  }
  
  
  pickImage(index , context) async{
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery , imageQuality: 80);
      if (img == null) {
        return;
      }else{
        pImagesList[index] = File(img.path);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    
  }
  uploadImage()async{
    pImagesLinks.clear();
    for(var item in pImagesList){
      if(item != null){
        var filename = basename(item.path);
        var destination = 'images/vendors/${currentUser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();
        pImagesLinks.add(n);
      }
    }
  }

  uploadProduct(context)async{
    var store = FirebaseFirestore.instance.collection('products').doc();
    await store.set({
      'featured_id':'',
      'isfeatured':false,
      'p_category':categoryvalue.value,
      'p_subcategory':subcategoryvalue.value,
      'p_colors':FieldValue.arrayUnion([Colors.red.value, Colors.brown.value]),
      'p_imgs': FieldValue.arrayUnion(pImagesLinks),
      'p_wishlist':FieldValue.arrayUnion([]),
      'p_desc':pdescController.text,
      'p_name':pnameController.text,
      'p_price':ppriceController.text,
      'p_quantity':ppriceController.text,
      'p_seller':Get.find<HomeContoller>().username,
      'p_rating':"5.0",
      'vendor-id':currentUser!.uid,
      
    });
    isloading(false);
    VxToast.show(context, msg: "Product upload");
  }
  
  addFeatured(docId)async {
    await FirebaseFirestore.instance.collection('products').doc(docId).set({
        'featured_id': currentUser!.uid,
        'isfeatured' : true,
      }, SetOptions(merge: true));
    
  }

  removeFeatured(docId)async {
    await FirebaseFirestore.instance.collection('products').doc(docId).set({
        'featured_id': currentUser!.uid,
        'isfeatured' : false,
      }, SetOptions(merge: true));
    
  }
  removeProduct(docId)async{
   await FirebaseFirestore.instance.collection('products').doc(docId).delete();
  }


}