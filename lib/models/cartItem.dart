import 'package:ecommerce_tutorials/models/product.dart';
import 'package:hive/hive.dart';
 part 'cartItem.g.dart';
@HiveType(typeId: 0)
class CartItem {
  @HiveField(0)
  Product product;
  @HiveField(1)
  int quantity;
  CartItem({
    required this.product,
    required this.quantity,
  });
}
