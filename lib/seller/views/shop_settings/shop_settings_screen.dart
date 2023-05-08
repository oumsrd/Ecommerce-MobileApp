import 'package:test_flutter/seller/Consts/const.dart';
import 'package:test_flutter/seller/widgets/custom_textField.dart';
import 'package:test_flutter/seller/widgets/normal_text.dart';
import 'package:velocity_x/velocity_x.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: boldText(text: shopSettings ,color: whiteColor,size: 16.0),
        actions: [
          TextButton(onPressed: (){}, child:normalText(text: save) )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextField(label: shopname,hint: nameHint),
            10.heightBox,
            customTextField(label: adress,hint: shopAddressHint),
            10.heightBox,
            customTextField(label: mobile,hint: shopMobileHint),
            10.heightBox,
            customTextField(label: website,hint: shopWebsiteHint),
            10.heightBox,
            customTextField(label:description,hint: shopDescHint,isDesc: true),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}