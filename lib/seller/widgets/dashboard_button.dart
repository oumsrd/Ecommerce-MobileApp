import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';

Widget dashboardButton(context , {title,count,icon}){
  var size= MediaQuery.of(context).size;
  return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      boldText(text:  title, size: 16.0),
                      boldText(text:  count, size: 20.0),

                    ],
                  )),
                Icon(icon,color: whiteColor,size: 40,)
              ],
            ).box.color(purpleColor).rounded.size(size.width*0.4,80).padding(const EdgeInsets.all(8)).make();

}