import 'package:ecommerce_tutorials/models/product.dart';
import 'package:ecommerce_tutorials/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:motion_toast/motion_toast.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  List images = [];
  @override
  Widget build(BuildContext context) {
    images = product.images!;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(product.name!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: product.id!,
            child: Image.network(image_url + product.images!.first.image!),
          ),
          Container(
            height: 125,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    image_url + images[index].image,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    MotionToast.success(
                      title: Text("المفضلة"),
                      description: Text("تم اضافة المنتج الى المفضلة بنجاح"),
                      width: 300,
                      height: 75,
                    ).show(context);
                  },
                  child: Icon(
                    Icons.favorite_outline,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.price.toString() + '\$',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.desc!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      bottomNavigationBar: LayoutBuilder(builder: ((context, constraints) {
        return InkWell(
          onTap: () {
            print('hello');
            MotionToast.success(
              title: Text("السلة"),
              description: Text("تم اضافة المنتج الى السلة بنجاح"),
              width: constraints.constrainWidth(),
              height: 75,
            ).show(context);
          },
          child: Container(
            width: constraints.maxWidth,
            color: Colors.red,
            height: 65,
            alignment: Alignment.center,
            child: Text(
              'اضافة الى السلة',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        );
      })),
    );
  }
}
