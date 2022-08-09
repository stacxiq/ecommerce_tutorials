import 'dart:convert';

import 'package:ecommerce_tutorials/models/product.dart';
import 'package:flutter/foundation.dart';


class BannerModel {
  String? id;
  String? expaired;
  int? type;
  String? image;
  String? url;
  List<Product>? products;
  BannerModel([
    this.id,
    this.expaired,
    this.type,
    this.image,
    this.url,
    this.products,
  ]);


 

  

  BannerModel copyWith({
    String? id,
    String? expaired,
    int? type,
    String? image,
    String? url,
    List<Product>? products,
  }) {
    return BannerModel(
      id ?? this.id,
      expaired ?? this.expaired,
      type ?? this.type,
      image ?? this.image,
      url ?? this.url,
      products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'expaired': expaired,
      'type': type,
      'image': image,
      'url': url,
      'products': products?.map((x) => x.toMap()).toList(),
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      map['id'],
      map['expaired'],
      map['type']?.toInt(),
      map['image'],
      map['url'],
      map['products'] != null ? List<Product>.from(map['products']?.map((x) => Product.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) => BannerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Banner(id: $id, expaired: $expaired, type: $type, image: $image, url: $url, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BannerModel &&
      other.id == id &&
      other.expaired == expaired &&
      other.type == type &&
      other.image == image &&
      other.url == url &&
      listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      expaired.hashCode ^
      type.hashCode ^
      image.hashCode ^
      url.hashCode ^
      products.hashCode;
  }
}
