import 'package:ecommerce_tutorials/controller/category_controller.dart';
import 'package:ecommerce_tutorials/utils/constant.dart';
import 'package:ecommerce_tutorials/utils/fade_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoryPage extends GetView<CategoryController> {
  CategoryPage({Key? key}) : super(key: key);
  late Size appSize;
  @override
  Widget build(BuildContext context) {
    appSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('الاصناف'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: appSize.width * 0.98,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.categories.length,
                itemBuilder: (_, int index) {
                  return FadeAnimation(
                    delay: 500 * (index + 1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: appSize.height * 0.18,
                        child: LayoutBuilder(builder: (context, constraint) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? Colors.red.withOpacity(0.7)
                                    : Color(0xffdc7f9b).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: index % 2 == 0
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Image.network(
                                        image_url +
                                            controller.categories[index].icone,
                                      ),
                                    ),
                                  ),
                                  8.height,
                                  Align(
                                    alignment: index % 2 == 0
                                        ? Alignment.centerLeft
                                        : Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        controller.categories[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                },
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2, mainAxisExtent: 180),
              ),
            )
          ],
        ),
      ),
    );
  }
}
