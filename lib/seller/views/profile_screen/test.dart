import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/seller/Consts/colors.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List vendorsdata = [] ;
  CollectionReference vendorref = FirebaseFirestore.instance.collection("products");
  getData () async {
    var responsprofile = await  vendorref.get();
    responsprofile.docs.forEach((element) {
      setState(() {
        vendorsdata.add(element.data());
      });
     });
  }
  @override
  void initState(){
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("voici image probleme");
               
    return Scaffold(
      
      body: ListView.builder(
        
        itemCount: vendorsdata.length,
        itemBuilder: (context , index){
         return Image.asset(
                  sac,//vendorsdata[index]['p_imgs'][0],
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
                
        }
        ),
    );
  }
}