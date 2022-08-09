import 'package:avatar_glow/avatar_glow.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_tutorials/controller/home_controller.dart';
import 'package:ecommerce_tutorials/models/category.dart';
import 'package:ecommerce_tutorials/models/product.dart';
import 'package:ecommerce_tutorials/pages/home/widgets/products_item.dart';
import 'package:ecommerce_tutorials/pages/products/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'العروض',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'عرض الكل',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  )
                ],
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: ListView.builder(
              itemCount: controller.products.length > 3
                  ? 3
                  : controller.products.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, int index) {
                return ProductItem(item: controller.products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buidgrid(int num, List<Product> products) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 280,
          crossAxisSpacing: 10.0,
        ),
        itemCount: products.length > 10 ? 10 : products.length,
        itemBuilder: (BuildContext context, int index) {
          return LayoutBuilder(builder: (context, constraint) {
            print('width c:${constraint.constrainWidth()}');
            print('height c:${constraint.constrainHeight()}');

            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (_, __, ___) => ProductPage(
                      product: products[num + index],
                    ),
                  ),
                );
              },
              child: Hero(
                tag: products[num + index].id!,
                child: Container(
                  width: constraint.constrainWidth(),
                  height: constraint.constrainHeight(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: constraint.constrainHeight() * 0.76,
                        width: constraint.constrainWidth(),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(
                            controller
                                .products[num + index].images!.first.image!,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(constraint.constrainHeight() * 0.02),
                        child: Text(
                          products[num + index].name!,
                          style: TextStyle(
                              fontSize: constraint.constrainHeight() * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: constraint.constrainHeight() * 0.02,
                            vertical: constraint.constrainHeight() * 0.01),
                        child: Text(
                          products[num + index].price.toString() + '\$',
                          style: TextStyle(
                              fontSize: constraint.constrainHeight() * 0.05,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
