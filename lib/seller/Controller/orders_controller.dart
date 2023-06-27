import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test_flutter/seller/Consts/firebase_consts.dart';

class OrdersController extends GetxController {
  var orders = [];
  var confirmed = false.obs;
  var ondelivory = false.obs;
  var delivered= false.obs;
/*
  getOrders(data){
    orders.clear();
    for(var item in data['orders']){
      if (item['vendors_id'] == currentUser!.uid) {
        orders.add(item);
      }
    }
    print(orders);
  }
*/


  placeMyOrder({required oredrePayementMethode , required totaleAmount }) async{
    await  firestore.collection('orders').doc().set({
      'order_code': "2356987459",
      'order_date': FieldValue.serverTimestamp(),
      'order_by':currentUser!.uid,
      'order_by_name':"user1name",
      'oredr_by_email': "user1@gamil.com",
      'order_by_adress':"marrakech",
      'order_by_phone':"0655555555",
      'order_by_postalcode':'4000',
    });
  }
}