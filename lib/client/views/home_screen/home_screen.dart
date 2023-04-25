import 'package:test_flutter/client/Consts/const.dart';
import 'package:test_flutter/client/views/widgets_common/home_buttons.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'components/feature_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      color: lightGrey,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          filled: true,
                          border: InputBorder.none,
                          fillColor: whiteColor,
                          hintText: searchanything,
                          hintStyle: TextStyle(color: textfeildGrey),
                        ),
                      ),
                    ),
                    //swipers brands
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: sliderlist.length,
                      itemBuilder: (context, index) {
                        return Image.asset(sliderlist[index],
                                fit: BoxFit.fitWidth)
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => homeButtons(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 2.5,
                          icon: index == 0
                              ? const Icon(
                                  Icons.calendar_today,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.flash_on,
                                  color: Colors.red,
                                ),
                          title: index == 0 ? todayDeal : flashsale,
                        ),
                      ),
                    ),
                    10.heightBox,
                    //seconde swipper list
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: sliderlist.length,
                      itemBuilder: (context, index) {
                        return Image.asset(sliderlist[index],
                                fit: BoxFit.fitWidth)
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) => homeButtons(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 3.5,
                          icon: index == 0
                              ? const Icon(
                                  Icons.calendar_today,
                                  color: Colors.red,
                                )
                              : index == 1
                                  ? const Icon(
                                      Icons.flash_on,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.category,
                                      color: Colors.red,
                                    ),
                          title: index == 0
                              ? todayDeal
                              : index == 1
                                  ? flashsale
                                  : topCategories,
                        ),
                      ),
                    ),
                    //featured categories
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featureCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 400,
                                  child: featureButton(
                                      title: featuredTitle1[index],
                                      icon: featuredImage1[index])),
                              10.heightBox,
                              Container(
                                  height: 80,
                                  width: 400,
                                  child: featureButton(
                                      title: featuredTitle2[index],
                                      icon: featuredImage2[index])),
                            ],
                          ),
                        ).toList(),
                      ),
                    ),
                    //all products that can search with!!!
                    20.heightBox,
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 300,
                        ),
                        itemBuilder: ((context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                hommeimg1,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                              const Spacer(),
                              "T-short"
                                  .text
                                  .color(darkFontGrey)
                                  .size(10)
                                  .make(),
                              10.heightBox,
                              "\$600".text.color(redColor).size(10).make()
                            ],
                          )
                              .box
                              .white
                              .roundedSM
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .padding(const EdgeInsets.all(12))
                              .make();
                        }))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
