import 'package:avatar_glow/avatar_glow.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_tutorials/controller/home_controller.dart';
import 'package:ecommerce_tutorials/models/category.dart';
import 'package:ecommerce_tutorials/pages/category/category_detail.dart';
import 'package:ecommerce_tutorials/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryWidget extends GetView<HomeController> {
  late Size appSize;

  int current = 0;
  // List<Category> categoriesData = [];
  @override
  Widget build(BuildContext context) {
    // AsyncValue<Response> categories = ref.watch(categoryProvider);
    appSize = MediaQuery.of(context).size;

    print('appsize $appSize');
    // TODO: implement

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          height: 125,
          child: ListView.builder(
            itemCount: controller.category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        print(controller.category[index].id);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => CategoryDetail(
                              categoryId:
                                  controller.category[index].id.toString(),
                              categoryName: controller.category[index].name,
                            ),
                          ),
                        );
                      },
                      child: AvatarGlow(
                        startDelay: Duration(milliseconds: 1000),
                        glowColor: Colors.red,
                        endRadius: 37.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        animate: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 300),
                        shape: BoxShape.circle,
                        curve: Curves.fastOutSlowIn,
                        child: Material(
                          elevation: 8.0,
                          shape: CircleBorder(),
                          color: Colors.transparent,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                image_url + controller.category[index].icone),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    controller.category[index].name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              );
            },
          ),
        ),
        Container(
          height: 20,
          color: Colors.grey.shade300,
        ),
        SizedBox(
          height: 10,
        ),

        // banner

        SizedBox(
          height: appSize.height * 0.35,
          width: appSize.width * 0.95,
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Column(
                children: [
                  SizedBox(
                    height: constraint.constrainHeight() * 0.65,
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.banners.length,
                        onPageChanged: controller.changePage,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: constraint.constrainHeight() - 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(image_url +
                                      controller.banners[index].image!),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.banners.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.active.value == index
                                    ? Colors.red
                                    : Colors.red.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
