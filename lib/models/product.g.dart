// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as String?,
      category_id: fields[1] as String?,
      brand_id: fields[2] as String?,
      name: fields[3] as String?,
      price: fields[4] as int?,
      offer: fields[5] as int?,
      offer_expired: fields[6] as String?,
      code_product: fields[7] as String?,
      desc: fields[8] as String?,
      advance_details: (fields[9] as List?)?.cast<dynamic>(),
      images: (fields[10] as List?)?.cast<ProductImage>(),
      brand: fields[11] as Brand?,
      category: fields[12] as CategoryModel?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category_id)
      ..writeByte(2)
      ..write(obj.brand_id)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.offer)
      ..writeByte(6)
      ..write(obj.offer_expired)
      ..writeByte(7)
      ..write(obj.code_product)
      ..writeByte(8)
      ..write(obj.desc)
      ..writeByte(9)
      ..write(obj.advance_details)
      ..writeByte(10)
      ..write(obj.images)
      ..writeByte(11)
      ..write(obj.brand)
      ..writeByte(12)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
