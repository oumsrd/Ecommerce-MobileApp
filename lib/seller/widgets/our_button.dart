import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
Widget ourButton({title,color=purpleColor , onPress}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      primary: color,
      padding: const EdgeInsets.all(12),
      //maximumSize:Size.fromWidth(30),
    ),
    onPressed: onPress,
     child: normalText(
      text:title,
      size: 16.0,
      ),
     );
}