import 'package:dio/dio.dart';
import 'package:ecommerce_tutorials/models/product.dart';
import 'package:ecommerce_tutorials/pages/products/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CategoryDetail extends ConsumerWidget {
  String categoryId;
  String categoryName;
  CategoryDetail(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  List<Product> products = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
    
    // AsyncValue<Response> productsAsync =
    //     ref.watch(categoryDetailProvider(categoryId));
    // // TODO: implement build
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.red,
    //     title: Text(categoryName),
    //   ),
    //   body: Container(
    //       child: productsAsync.when(
    //           data: (result) {
    //             final productsResult = result.data;

    //             for (var item in productsResult) {
    //               products.add(Product.fromJson(item));
    //             }

    //             return GridView.builder(
    //                 gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 2,
    //                   mainAxisExtent: 280,
    //                   crossAxisSpacing: 10.0,
    //                 ),
    //                 itemCount: products.length,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return LayoutBuilder(builder: (context, constraint) {
    //                     print('width c:${constraint.constrainWidth()}');
    //                     print('height c:${constraint.constrainHeight()}');

    //                     return InkWell(
    //                       onTap: () {
    //                         Navigator.of(context).push(
    //                           PageRouteBuilder(
    //                             transitionDuration: Duration(seconds: 1),
    //                             pageBuilder: (_, __, ___) => ProductPage(
    //                               product: products[index],
    //                             ),
    //                           ),
    //                         );
    //                       },
    //                       child: Container(
    //                         width: constraint.constrainWidth(),
    //                         height: constraint.constrainHeight(),
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Container(
    //                               height: constraint.constrainHeight() * 0.76,
    //                               width: constraint.constrainWidth(),
    //                               child: FittedBox(
    //                                 fit: BoxFit.fill,
    //                                 child: Image.network(
    //                                   products[index].images!.first,
    //                                 ),
    //                               ),
    //                             ),
    //                             Padding(
    //                               padding: EdgeInsets.all(
    //                                   constraint.constrainHeight() * 0.02),
    //                               child: Text(
    //                                 products[index].title!,
    //                                 style: TextStyle(
    //                                     fontSize:
    //                                         constraint.constrainHeight() * 0.05,
    //                                     fontWeight: FontWeight.bold),
    //                               ),
    //                             ),
    //                             Padding(
    //                               padding: EdgeInsets.symmetric(
    //                                   horizontal:
    //                                       constraint.constrainHeight() * 0.02,
    //                                   vertical:
    //                                       constraint.constrainHeight() * 0.01),
    //                               child: Text(
    //                                 products[index].price.toString() + '\$',
    //                                 style: TextStyle(
    //                                     fontSize:
    //                                         constraint.constrainHeight() * 0.05,
    //                                     fontWeight: FontWeight.w500),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     );
    //                   });
    //                 });
    //           },
    //           error: (err, stack) => Text('Error: $err'),
    //           loading: () => Container(
    //                 child: Center(
    //                   child: LoadingIndicator(
    //                     indicatorType: Indicator.ballScale,
    //                     colors: [Colors.red],
    //                   ),
    //                 ),
    //               ))),
    // );
  }
}
