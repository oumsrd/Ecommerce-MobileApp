import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/client/constants/theme.dart';
import 'package:test_flutter/client/provider/app_provider.dart';
import 'package:test_flutter/seller/Consts/const.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/seller/views/auth_screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:test_flutter/seller/views/products_screen/add_product.dart';
import 'package:test_flutter/seller/views/profile_screen/test.dart';
import 'package:test_flutter/seller/views/splash_screen/splash_screen.dart';
import 'client/screens/auth_ui/welcome/welcome.dart';
import 'seller/views/home_screen/home.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51MWx8OAVMyklfe3CsjEzA1CiiY0XBTlHYbZ8jQlGtVFIwQi4aNeGv8J1HUw4rgSavMTLzTwgn0XRlwoTVRFXyu2h00mRUeWmAf";
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = Settings(
  persistenceEnabled: true,
  cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED, 
);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  void initState(){
    super.initState();
    checkUser();
  }
  

  var isLoggedin = false;

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        isLoggedin = false;
      }else{
        isLoggedin = true;
      }
      setState(() {
        
      });

     });
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ecommerce mobile app',
        //home: Home(),
        theme: themeData,
        home:   const SplashScreen(), //AddProduct(),
        
        /*ThemeData(
          
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),*/
        
      ),
    );
  }
}
