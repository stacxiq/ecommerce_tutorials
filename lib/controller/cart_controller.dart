import 'dart:convert';


import 'package:ecommerce_tutorials/models/cartItem.dart';
import 'package:ecommerce_tutorials/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CartController extends GetxController {
  Box cart = Get.find<Box>(tag: CART);
  Box ids = Get.find<Box>(tag: IDS);
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxList key = [].obs;
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();

  RxInt totalPrice = 0.obs;
  @override
  void onInit() async {
    for (var item in cart.values) {
      cartItems.add(item);
      // totalPrice.value +=
      //     ((item as CartItem).product.price!) * (item as CartItem).quantity;
    }
    for (var item in cart.keys) {
      key.add(item);
    }

    super.onInit();
  }

  void addToCart(CartItem product) {
    print(cart.values);

    if (ids.values.contains(product.product.id)) {
      Get.snackbar('cart', 'product already added');
      return;
    } else {
      cart.add(product);
      ids.add(product.product.id);
    }
  }

  void minusQuantity(int index, CartItem product) {
    if (product.quantity == 1) {
      removeItem(index, product);
    } else {
      product.quantity = product.quantity - 1;
      // totalPrice.value -= product.product.price!;
      for (var i = 0; i < cart.keys.length; i++) {
        print('mykey ${cart.keyAt(i)}');
        CartItem item = cart.get(cart.keyAt(i));
        if (item.product.id == product.product.id) {
          cart.put(cart.keyAt(i), product);
        }
      }
    }
  }

  void increaseQuantity(int index, CartItem product) {
    product.quantity = product.quantity + 1;
    // totalPrice.value += product.product.price!;

    for (var i = 0; i < cart.keys.length; i++) {
      print('mykey ${cart.keyAt(i)}');
      CartItem item = cart.get(cart.keyAt(i));
      if (item.product.id == item.product.id) {
        cart.put(cart.keyAt(i), product);
      }
    }
  }

  void removeItem(int index, CartItem item) {
    cart.deleteAt(index);
    try {
      ids.deleteAt(index);
    } catch (e) {
      print(e);
    }

    cartItems.removeAt(index);
    // cartItems.remove(item);
  }

  void checkout() {
    List cartList = [];
    for (var item in cartItems) {
      cartList.add({
        'id': item.product.id,
        'quantity': item.quantity,
      });
    }
    print(address.text);
    // checkoutRepository
    //     .checkout({'address': address.text, 'products': cartList});
  }
}
