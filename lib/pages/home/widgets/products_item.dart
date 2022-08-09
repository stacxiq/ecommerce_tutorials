import 'package:ecommerce_tutorials/models/product.dart';
import 'package:ecommerce_tutorials/pages/products/products.dart';
import 'package:ecommerce_tutorials/utils/constant.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product item;
  const ProductItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductPage(
              product: item,
            ),
          ),
        );
      },
      child: Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(vertical: 6),
          height: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(image_url + item.images!.first.image!),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          item.name!,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item.desc!,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Expanded(
                          child: Text(item.price.toString() + '\$',
                              maxLines: 2, textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 30,
                width: 30,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(Icons.favorite_outline),
              )
            ],
          )),
    );
  }
}


// ListTile(
//           isThreeLine: true,
//           leading: Image.network(
//             item.images!.first,
//             fit: BoxFit.cover,
//           ),
//           title: Text(item.title!),
//           subtitle: Text(item.description!),
//         )