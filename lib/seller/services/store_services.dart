import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_flutter/seller/Consts/firebase_consts.dart';

class StoreServices {
   static getProfile(uid){
    return firestore.collection('vendors').where('id' , isEqualTo: uid).get();
   }
   static getMessage(uid){
    return firestore.collection('chats').where('told' , isEqualTo: uid).snapshots() ;
   }
   static getProduct(uid){
    return firestore.collection('products').where('vendor_id' , isEqualTo: uid).snapshots() ;
   }
   static getOrders(uid){
    return firestore.collection('orders').where('vendors', arrayContains: uid , isEqualTo: uid).snapshots() ;
   }

   static getPopularProducts(uid){
    return FirebaseFirestore.instance..collection('products').where('vendor_id' , isEqualTo: uid).orderBy('p_wishlist'.length) ;
   }
}