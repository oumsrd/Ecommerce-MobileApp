import 'package:test_flutter/seller/Consts/const.dart';

Widget loadingIndicator(){

  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(purpleColor),
    ),

  );
}