import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
part 'productImages.g.dart';

@HiveType(typeId: 2)
class ProductImage {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? product_id;
  @HiveField(2)
  String? image;
  ProductImage({
    this.id,
    this.product_id,
    this.image,
  });

  ProductImage copyWith({
    String? id,
    String? product_id,
    String? image,
  }) {
    return ProductImage(
      id: id ?? this.id,
      product_id: product_id ?? this.product_id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': product_id,
      'image': image,
    };
  }

  factory ProductImage.fromMap(Map<String, dynamic> map) {
    return ProductImage(
      id: map['id'],
      product_id: map['product_id'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductImage.fromJson(String source) =>
      ProductImage.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductImage(id: $id, product_id: $product_id, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductImage &&
        other.id == id &&
        other.product_id == product_id &&
        other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ product_id.hashCode ^ image.hashCode;
}
