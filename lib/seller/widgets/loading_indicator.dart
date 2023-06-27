import 'package:test_flutter/seller/Consts/const.dart';

Widget loadingIndicator({circleColor = purpleColor }){

  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(circleColor),
    ),

  );
}