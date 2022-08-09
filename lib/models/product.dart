import 'dart:convert';


import 'package:ecommerce_tutorials/models/Brand.dart';
import 'package:ecommerce_tutorials/models/category.dart';
import 'package:ecommerce_tutorials/models/productImages.dart';
import 'package:hive/hive.dart';
part 'product.g.dart';
@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? category_id;
  @HiveField(2)
  String? brand_id;
  @HiveField(3)
  String? name;
  @HiveField(4)
  int? price;
  @HiveField(5)
  int? offer;

  @HiveField(6)
  String? offer_expired;
  @HiveField(7)
  String? code_product;
  @HiveField(8)
  String? desc;


  @HiveField(9)
  List? advance_details;
  @HiveField(10)
  List<ProductImage>? images;
  @HiveField(11)
  Brand? brand;
  @HiveField(12)
  CategoryModel? category;
  Product({
    this.id,
    this.category_id,
    this.brand_id,
    this.name,
    this.price,
    this.offer,
    this.offer_expired,
    this.code_product,
    this.desc,
    required this.advance_details,
    this.images,
    this.brand,
    this.category,
  });

  Product copyWith({
    String? id,
    String? category_id,
    String? brand_id,
    String? name,
    int? price,
    int? offer,
    String? offer_expired,
    String? code_product,
    String? desc,
    dynamic? advance_details,
    List<ProductImage>? images,
    Brand? brand,
    CategoryModel? category,
  }) {
    return Product(
      id: id ?? this.id,
      category_id: category_id ?? this.category_id,
      brand_id: brand_id ?? this.brand_id,
      name: name ?? this.name,
      price: price ?? this.price,
      offer: offer ?? this.offer,
      offer_expired: offer_expired ?? this.offer_expired,
      code_product: code_product ?? this.code_product,
      desc: desc ?? this.desc,
      advance_details: advance_details ?? this.advance_details,
      images: images ?? this.images,
      brand: brand ?? this.brand,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': category_id,
      'brand_id': brand_id,
      'name': name,
      'price': price,
      'offer': offer,
      'offer_expired': offer_expired,
      'code_product': code_product,
      'desc': desc,
      'advance_details': advance_details,
      'images': images?.map((x) => x.toMap()).toList(),
      'brand': brand?.toMap(),
      'category': category?.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      category_id: map['category_id'],
      brand_id: map['brand_id'],
      name: map['name'],
      price: map['price']?.toInt(),
      offer: map['offer']?.toInt(),
      offer_expired: map['offer_expired'],
      code_product: map['code_product'],
      desc: map['desc'],
      advance_details: map['advance_details'] != null
          ? jsonDecode(map['advance_details'])
          : null,
      images: map['images'] != null
          ? List<ProductImage>.from(
              map['images']?.map((x) => ProductImage.fromMap(x)))
          : null,
      brand: map['brand'] != null ? Brand.fromMap(map['brand']) : null,
      category: map['category'] != null
          ? CategoryModel.fromMap(map['category'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, category_id: $category_id, brand_id: $brand_id, name: $name, price: $price, offer: $offer, offer_expired: $offer_expired, code_product: $code_product, desc: $desc, advance_details: $advance_details, images: $images, brand: $brand, category: $category)';
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category_id.hashCode ^
        brand_id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        offer.hashCode ^
        offer_expired.hashCode ^
        code_product.hashCode ^
        desc.hashCode ^
        advance_details.hashCode ^
        images.hashCode ^
        brand.hashCode ^
        category.hashCode;
  }
}
